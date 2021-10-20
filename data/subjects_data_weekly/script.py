import os
import shutil

root_folder = "audio"

all_audio_files = os.listdir(root_folder)

def subject_wise(all_files):
    for f in all_files:
        sub_id = f.split("_")[0]
        sub_folder = f"vadtestsubject_{sub_id}"
        audio_fpath = os.path.join(root_folder, f)
        if not os.path.exists(sub_folder): os.mkdir(sub_folder)

        shutil.copy(audio_fpath, sub_folder)

# subject_wise(all_audio_files)

def rename_files(rn_list_file):
    with open(rn_list_file, "r") as rf:
        for fn in rf.readlines():
            fn = fn.replace("\n", "")
            n_fn = fn.replace("_Exhale_Wheeze_Inhale_", "_Breath_")

            print(fn, "to", n_fn)
            shutil.move(fn, n_fn)

rename_files("to_rename.txt")

