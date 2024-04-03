####
#### pip
####
pip show botocore
pip index versions botocore
pip install botocore==1.31.75 --user
pip install boto3==1.33.8 --user

####
#### tmp fix
####

# C:\Users\hjiang\AppData\Local\Programs\Python\Python312\Lib\site-packages\pip\_internal\utils\misc.py
# def ensure_dir(path: str) -> None:
# if (path != "C:\\"): os.makedirs(path)
