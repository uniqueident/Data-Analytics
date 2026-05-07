# Credit

A big thanks for publishing the heart-disease dataset to the following:
   Hungarian Institute of Cardiology. Budapest: Andras Janosi, M.D.
   University Hospital, Zurich, Switzerland: William Steinbrunn, M.D.
   University Hospital, Basel, Switzerland: Matthias Pfisterer, M.D.
   V.A. Medical Center, Long Beach and Cleveland Clinic Foundation: Robert Detrano, M.D., Ph.D.

Thank you!

# Heart Disease Databases

This repository does *not* contain all of the files of the original repository, which can be found: [here](https://uci-ics-mlr-prod.aws.uci.edu/dataset/45/heart+disease)

Original data can be found in the data_original folder, excluding the unprocessed cleveland.data file, as it seems to have been corrupted.

## Observations

Number of rows per dataset:
    Hungarian: 294
    Switzerland: 123
    Long Beach VA: 200

There are 76 total attributes in the original files, including the predicted attribute (num)

## Original Attribute information

    1 id: patient identification number
    2 ccf: social security number (I replaced this with a dummy value of 0)
    3 age: age in years
    4 sex: sex (1 = male; 0 = female)
    5 painloc: chest pain location (1 = substernal; 0 = otherwise)
    6 painexer (1 = provoked by exertion; 0 = otherwise)
    7 relrest (1 = relieved after rest; 0 = otherwise)
    8 pncaden (sum of 5, 6, and 7)
    9 cp: chest pain type
      -- Value 1: typical angina
      -- Value 2: atypical angina
      -- Value 3: non-anginal pain
      -- Value 4: asymptomatic
    10 trestbps: resting blood pressure (in mm Hg on admission to the 
       hospital)
    11 htn
    12 chol: serum cholestoral in mg/dl
    13 smoke: I believe this is 1 = yes; 0 = no (is or is not a smoker)
    14 cigs (cigarettes per day)
    15 years (number of years as a smoker)
    16 fbs: (fasting blood sugar > 120 mg/dl)  (1 = true; 0 = false)
    17 dm (1 = history of diabetes; 0 = no such history)
    18 famhist: family history of coronary artery disease (1 = yes; 0 = no)
    19 restecg: resting electrocardiographic results
       -- Value 0: normal
        -- Value 1: having ST-T wave abnormality (T wave inversions and/or ST 
                    elevation or depression of > 0.05 mV)
        -- Value 2: showing probable or definite left ventricular hypertrophy
                    by Estes' criteria
    20 ekgmo (month of exercise ECG reading)
    21 ekgday(day of exercise ECG reading)
    22 ekgyr (year of exercise ECG reading)
    23 dig (digitalis used furing exercise ECG: 1 = yes; 0 = no)
    24 prop (Beta blocker used during exercise ECG: 1 = yes; 0 = no)
    25 nitr (nitrates used during exercise ECG: 1 = yes; 0 = no)
    26 pro (calcium channel blocker used during exercise ECG: 1 = yes; 0 = no)
    27 diuretic (diuretic used used during exercise ECG: 1 = yes; 0 = no)
    28 proto: exercise protocol
          1 = Bruce     
          2 = Kottus
          3 = McHenry
          4 = fast Balke
          5 = Balke
          6 = Noughton 
          7 = bike 150 kpa min/min  (Not sure if "kpa min/min" is what was 
              written!)
          8 = bike 125 kpa min/min  
          9 = bike 100 kpa min/min
         10 = bike 75 kpa min/min
         11 = bike 50 kpa min/min
         12 = arm ergometer
    29 thaldur: duration of exercise test in minutes
    30 thaltime: time when ST measure depression was noted
    31 met: mets achieved
    32 thalach: maximum heart rate achieved
    33 thalrest: resting heart rate
    34 tpeakbps: peak exercise blood pressure (first of 2 parts)
    35 tpeakbpd: peak exercise blood pressure (second of 2 parts)
    36 dummy
    37 trestbpd: resting blood pressure
    38 exang: exercise induced angina (1 = yes; 0 = no)
    39 xhypo: (1 = yes; 0 = no)
    40 oldpeak = ST depression induced by exercise relative to rest
    41 slope: the slope of the peak exercise ST segment
        -- Value 1: upsloping
        -- Value 2: flat
        -- Value 3: downsloping
    42 rldv5: height at rest
    43 rldv5e: height at peak exercise
    44 ca: number of major vessels (0-3) colored by flourosopy
    45 restckm: irrelevant
    46 exerckm: irrelevant
    47 restef: rest raidonuclid (sp?) ejection fraction
    48 restwm: rest wall (sp?) motion abnormality
        0 = none
        1 = mild or moderate
        2 = moderate or severe
        3 = akinesis or dyskmem (sp?)
    49 exeref: exercise radinalid (sp?) ejection fraction
    50 exerwm: exercise wall (sp?) motion 
    51 thal: 3 = normal; 6 = fixed defect; 7 = reversable defect
    52 thalsev: not used
    53 thalpul: not used
    54 earlobe: not used
    55 cmo: month of cardiac cath (sp?)  (perhaps "call")
    56 cday: day of cardiac cath (sp?)
    57 cyr: year of cardiac cath (sp?)
    58 num: diagnosis of heart disease (angiographic disease status)
        -- Value 0: < 50% diameter narrowing
        -- Value 1: > 50% diameter narrowing
        (in any major vessel: attributes 59 through 68 are vessels)
    59 lmt
    60 ladprox
    61 laddist
    62 diag
    63 cxmain
    64 ramus
    65 om1
    66 om2
    67 rcaprox
    68 rcadist
    69 lvx1: not used
    70 lvx2: not used
    71 lvx3: not used
    72 lvx4: not used
    73 lvf: not used
    74 cathef: not used
    75 junk: not used
    76 name: last name of patient 
	(I replaced this with the dummy string "name")

Missing Attribute Values: Several.  Distinguished with value -9.0.

    Class Distribution:
        Database:      0   1   2   3   4 Total
          Cleveland: 164  55  36  35  13   303
          Hungarian: 188  37  26  28  15   294
        Switzerland:   8  48  32  30   5   123
      Long Beach VA:  51  56  41  42  10   200

### Expanded definitions and explanations of variables

2 ccf -> in he final data, I think its removed.

9 pncaden -> It is the sum of 5, 6, 7.

11 htn -> I believe that this is associated on whether or not the patient has hypertension. read more here:[Cleveland Clinic](https://my.clevelandclinic.org/health/diseases/21840-hypertensive-heart-disease)

36 dummy -> Is an exact clone of an existing column in the dataset. Can safely be removed.

39 xhypo -> I believe that this is a yes or no based on whether or not the patient has hypoxemia. read more here: [Cleveland Clinic](https://my.clevelandclinic.org/health/diseases/23063-hypoxia) 

--- 

[ecg terms](https://litfl.com/st-segment-ecg-library/)
[ecg terms 2](https://www.qaly.co/ecg-glossary)

ST segment -> The ST segment is noted as the flat section at the end of the S wave and the beginning of the T wave.
[Life in the Fastlane](https://litfl.com/st-segment-ecg-library/)

ST depression -> This occurs when the ST segment ends up **below** the **PR line**. As the PR line is used as the baseline. This may occur during exercise stress testing naturally as well. [Cardiovascular Medicine](https://ecgwaves.com/st-segment-normal-abnormal-depression-elevation-causes/)

41 slope -> This variable is context based on the ST segment. It is assigned a value depending on the slope of the line during exercise. Normal ST segments have an almost flat (value 2) horizontal line (with possible miniscule upward slope) compared against the J point. (J-60 or j-80 typically). [RCEM Learning](https://www.rcemlearning.co.uk/modules/st-elevation-without-infarction/lessons/basic-ecg-interpretation/topic/definition-of-st-elevation/)

42 rldv5 -> This does not have any simply justifiable answer from the documentation. Best guess is that it is an ECG lead placement measurement somehow from RL (right leg) to V5 (v5 lead) on the person. And somehow it is the voltage measurement. 


43 rldv5e -> Same as above but during exercise

42 and 43 cannot be justified without further knowledge of which I do not possess. So assume I am wrong.


---

### All of the following are major vessels

All arteries are blood vessels, not all blood vessels are arteries.


- Proximal means
  - Initial region near the origin
- Mid means
  - The region between Proximal and Distal
- Distal means
  - The region near the end

This means that proximal heart issues are likely more dangerous than Distal heart issues.

59 lmt -> This is likely shorthand for Left Main Trunk, may also be identical to Left Main coronary Artery (LMCA). check it out here: [John Hopkins medicine](https://www.hopkinsmedicine.org/health/conditions-and-diseases/anatomy-and-function-of-the-coronary-arteries)


Definitions found here: [Johnsonfrancis](https://johnsonfrancis.org/professional/what-is-distal-disease-in-the-lad/)

Read for more context on dataset: [Cleveland Clinic](https://my.clevelandclinic.org/health/body/22973-coronary-arteries)

60 ladprox -> This is shorthand for the proximal left anterior decending (LAD) artery. This artery originates from the LMCA. Is a very important. [IMAIOS e-Anatomy](https://www.imaios.com/en/e-anatomy/anatomical-structures/proximal-lad-artery-121133752#)

61 laddist -> This refers to the distal segment of the LAD. Distal refers to the segment near the end. [IMAIOS e-Anatomy](https://www.imaios.com/en/e-anatomy/anatomical-structures/distal-lad-artery-121133324#)

62 diag -> This referes to the diagonal artery which branches of the LAD. They are notated D1 -> Dn. This one is likely the first diagonal branch, notated as D1. This artery is located after the Proximal LAD, but before the mid LAD. Image for reference: [Radiology Assistant](https://radiologyassistant.nl/cardiovascular/anatomy/coronary-anatomy-and-anomalies)

63 cxmain -> This likely refers to the Left Circumflex artery (LCX), which is one of the other branches off of the LMCA. [Cleveland Clinic](https://my.clevelandclinic.org/health/body/23926-circumflex-artery)

64 ramus -> This likely refers to the *ramus intermedius*. This is a biological variant among individuals and occurs in $\frac{1}{3}$ of the population. This artery sits in between the LAD and the LCX. It is the third possible branch from the LMCA.

65 om1 -> This refers to the first obtuse marginal artery.

66 om2 -> This refers to the second obtuse marginal artery.

Please note that both om1, om2 supply the lateral portion of LV (left ventricle). This helps pump oxygenated blood to the body. [IMAIOS e-Anatomy](https://www.imaios.com/en/e-anatomy/anatomical-structures/left-ventricle-14357616#from=1) and [Thoracic Key](https://thoracickey.com/coronary-anatomy-and-anomalies/)


67 rcaprox -> This likely refers to the proximal right coronary artery. (RCA). This is responsible for supplying blood to your heart, specifically your right atrium and ventricle.[Cleveland Clinic](https://my.clevelandclinic.org/health/body/22973-coronary-arteries)

68 rcadist -> This likely refers to the distal right coronary artery. (RCA). This is responsible for supplying blood to your heart, specifically your right atrium and ventricle. [Cleveland Clinic](https://my.clevelandclinic.org/health/body/22973-coronary-arteries)

# EndNote

Any information that has not been provided in the document above is believed to be simple to discern from the [heart-disease.names](heart-disease.names)