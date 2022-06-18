#Command Line parameters
param (
    [string]$repo_name=$(
        [string]$path = (Get-Location);
        $path.split("\\")[-1]),
    
    [switch]$private = $false)
[string]$scriptPath = (Get-Location);

#Help function
function help{
    Write-Host "Github repositry"
    Write-host "Usage: ghrepo [-repo_name {repository name}] [-private]"
    Write-Host "Options:"
    Write-Host "-private: creates a private repositry"
    Write-Host "-h, --help: shows this help menu"
    exit 0
}

#If the help is requested display it
if ($args[0] -eq "-h" -or $args[0] -eq "--help"){
    help
}


$examplespath = $PSScriptRoot + '\examples'

#Check if there is a .git folder present
$testpath = $($scriptPath + '\.git')
Write-Host $testpath
if (Test-Path -Path $testpath){
    Write-Host "Directory is already a git repository" -foregroundcolor red
    Write-Host "Delete the .git folder or use an other folder" -foregroundcolor red
    exit 1
}

# initialize a git repo
git init -b main
git add .
git commit -m "initial commit"

# create a private github repo
if ($private){
    gh repo create $repo_name  --source=. --private
} else {
    gh repo create $repo_name  --source=. --public
}

# push everything to the new repository
git push --set-upstream origin main