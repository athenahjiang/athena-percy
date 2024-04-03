# bitbucket: check "C:\Users/hjiang/.ssh" for id_rsa and id_rsa.pub 
git config --global http.sslVerify false
git config --global user.name "Percy Jiang"
git config --global user.email hjiang@athenahealth.com

####
#### branches
####

# list
git branch # local
git branch -r # remote

# switch
git checkout . # reset
git checkout "branch-name" # don't start with origin
git reset --hard origin/"branch-name" # remove local commits

####
#### revert
####
git revert 660871f91d1 77ef3a217f4	55f9fbe309f cec89eef05b
git revert 660871f91d1
git revert -m 1

####
#### before push
####
git merge "source-branch-name"
mvn clean verify
mvn spotless::apply

####
#### other
####

git mv oldname.ts newname.ts # rename a file
