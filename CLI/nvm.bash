####
#### powershell
####
# https://github.com/aaronpowell/ps-nvm/blob/master/.docs/reference.md

# install
Install-Module nvm

# path of node versions
Get-NodeInstallLocation

# list node versions installed
Get-NodeVersions

# install
Install-NodeVersion 14.17.0

# set
Set-NodeVersion 18.19.0
Set-NodeVersion -Persist User 18.19.0

####
#### normal
####
nvm install 14.17.0
nvm use 14.17.0

####
#### versions
####
# node 14.17.0
# node 18.19.0
# npm 7.24.2
