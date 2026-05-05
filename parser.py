import os
import argparse

def to_file(file:str, content:list[str])-> None:
    try:
        with open(file, "w") as parsed:
            for row in content:
                parsed.write(row + "\n")
    except Exception as e:
        print(f"Failed to write to file: {e}")

def mono_parse(file:str, e_keyword:str) -> list[str]:
    entries:list[str] = list()
    try:

        with open(file, "r") as dfile:
            observation:str = ""

            for line in dfile:
                line = line.strip()
                line = line.replace(" ", ",")

                if line.find(e_keyword)>-1:
                    observation += line
                    entries.append(observation)

                    val = observation.split(",")
                    print(f"Patient ID: {val[0]} with # entries: {len(val)}\n")
                    
                    observation = ""

                else:
                    observation += line + ","

        print(f"---success on file: {file} || with {len(entries)} total entries!---\n")
        return entries
    
    except Exception as e:

        print(f"Failed to read from file {file}\n")
        print(f"Error:{e}")
        return entries
    

if __name__ == "__main__":

    parser = argparse.ArgumentParser()
    parser.add_argument("--input", "--i", nargs = "+", required=True, help = "Files to read")
    parser.add_argument("--keyword", "--k", required = True, help = "Keyword to search for", type=str)
    parser.add_argument("--SavePath", "--sp", required = True, help = "Path to save the file", type=str)
    args = parser.parse_args()

    input_files = args.input
    keyword = args.keyword
    save_path = args.SavePath

    for file in input_files:
        if not os.path.isfile(file) and  not os.path.isdir(file):
            print(f"File does not exist. {file}")
            exit(-1)
        else:
            parsed_file = mono_parse(file, keyword)  
            file_name = os.path.basename(file)
            try:
                if(not os.path.isdir(save_path)):
                    os.makedirs(save_path,exist_ok=True)
                to_file((save_path + "/" + file_name), parsed_file)

            except Exception as e:
                print(f"failed to save file {file_name}\n")
                print(e)



