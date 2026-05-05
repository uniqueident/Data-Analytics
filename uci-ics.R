library(tidyverse)
library(dplyr)
library(readxl)

options(scipen = 999)

#Need to manually add these headers onto the dataset,  as such for simplicity sake,  it will just be placed in the script.
heart_disease_cols  = c("id", "ccf", "age", "sex", "painloc", "painexer", "relrest", "pncaden", "cp", "trestbps", 
          "htn", "chol", "smoke", "cigs", "years", "fbs", "dm", "famhist", "restecg", "ekgmo", 
          "ekgday", "ekgyr", "dig", "prop", "nitr", "pro", "diuretic", "proto", "thaldur", "thaltime", 
          "met", "thalach", "thalrest", "tpeakbps", "tpeakbpd", "dummy", "trestbpd", "exang", "xhypo", 
          "oldpeak", "slope", "rldv5", "rldv5e", "ca", "restckm", "exerckm", "restef", "restwm", 
          "exeref", "exerwm", "thal", "thalsev", "thalpul", "earlobe", "cmo", "cday", "cyr", "num", 
          "lmt", "ladprox", "laddist", "diag", "cxmain", "ramus", "om1", "om2", "rcaprox", "rcadist", 
          "lvx1", "lvx2", "lvx3", "lvx4", "lvf", "cathef", "junk", "name")

#read the files,  -9 is an NA value according to (heart-disease.names)
hungarian_data <- read_csv(
                            "./data_csv/hungarian.data", 
                            col_names = FALSE, 
                            na = "-9"
                        )

long_beach_va_data <- read_csv("./data_csv/long-beach-va.data",  
                            col_names = FALSE, 
                            na = "-9"
                        )
switzerland_data <- read_csv("./data_csv/switzerland.data", 
                             col_names = FALSE, 
                             na = "-9"
                        )


#Rename all of the columns using the previously made header vector,  and assign the name of the hospital to the data
#HG for the hungarian dataset
#LB for the long-beach dataset
#SL for the switzerland dataset

named_hungarian <- hungarian_data |>
    rename_with(~ heart_disease_cols)|>
            mutate(
                name = NULL, 
                Hospital = "HG"
            )
named_long_beach <- long_beach_va_data |>
    rename_with(~ heart_disease_cols)|>
            mutate(
                name = NULL, 
                Hospital = "LB"
            )
named_switzerland <- switzerland_data |>
    rename_with(~ heart_disease_cols) |>
            mutate(
                name = NULL, 
                Hospital = "SL"
            )

#Good news,  we can calculate pncaden from the other rows. (Read: heart-disease.names)
full_set <-
    bind_rows(named_hungarian, named_long_beach, named_switzerland)|>
    mutate(
        pncaden = painloc+painexer+relrest
    )

#Giant mono filter. I would not recommend removing this filter,  as it ensures data consistency
large_set <- full_set |>
    select(!c(id, thalsev, thaltime, proto, dm, exeref, ccf, restckm, exerckm, restef, restwm, exerwm, thalpul, earlobe, lvx1:junk))|>
    mutate(
        hasSmoked = if_else(
            (!is.na(smoke) & smoke>0)|(!is.na(cigs) & cigs>0)|(!is.na(years) & years>0), 
            1, 
            if_else(
                (is.na(smoke)&is.na(cigs)&is.na(years)), 
                NA, 
                0
            ), 
        )
    )|>
    select(!c(ekgmo:ekgyr, smoke, cigs, years, met, diuretic, dummy, cmo:cyr, ca, thal, famhist))

#This gives us the same subset of variables in the processed.cleveland.data file if we want that.
cleveland_set <- full_set|>
    select(c(age, sex, cp, trestbps, chol, fbs, restecg, thalach, exang, oldpeak, slope, ca, thal, num))

#save heart data before final filter.(slope and fbs are the biggest affectors of this data)
heart_data <- large_set |> select(!c(hasSmoked, slope, fbs, prop, dig, nitr, pro))

#remove heart specific data in order to increase the amount of observations we have.
large_set <- large_set |> 
    select(!c(rcadist:lmt, hasSmoked))

#remove all NA values for easily measurable data. (use for debugging)
t_set <- large_set |> na.omit()
m_set <- cleveland_set |> na.omit()
h_set <- heart_data |> na.omit()

#Calculates the percent in a dataframe based on grouping,  on how much is NA,  returns as df.
percent_na <- function(df, group){
    df_na <- df |>
        group_by({{group}})|>
            summarize_all(~ ((as.double(sum(is.na(.)))/as.double(n()))*100))
    return(df_na)
}

#Writes to a file given a dataframe,  group,  folder,  and optionally removes NA data.
write_to <- function(df, group, folder, omitNa){
    df_na <- percent_na(df, {{group}})
    df_filtered <- df
    if(omitNa == TRUE){
        df_filtered <- na.omit(df_filtered)
    }
    if(!dir.exists(folder)){
        dir.create(folder, recursive = TRUE)
    }
    write_csv(df_na, file.path(folder, "data.missing"))
    write_csv(df_filtered, file.path(folder, "data.filtered"))
    
}

#does the write call but for removed and not removed NA.
write_both <- function(df, group, folder){
    
    write_to(df, {{group}}, paste(folder, "/na_removed", sep=""), TRUE)
    write_to(df, {{group}}, paste(folder, "/na_kept", sep=""), FALSE)
}

#Redundancy in this case is okay. (this is a script,  I know that below is not optimized)

folder_path <- "./data_processed/"

#inefficient I know. But its a script.
write_both(full_set, Hospital, paste(folder_path, "full_set", sep=""))
write_both(large_set, Hospital, paste(folder_path, "large_set", sep=""))
write_both(heart_data, Hospital, paste(folder_path, "heart_data", sep="")) 
write_both(cleveland_set, NA, paste(folder_path, "cleveland_set", sep=""))