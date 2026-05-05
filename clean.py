import os
import shutil
if __name__ == "__main__":
    try:
        path = os.path.abspath("./data_processed/")
        shutil.rmtree(path)
    except Exception as e:
        print(f"failure: {e}")