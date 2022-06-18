$examplespath = $PSScriptRoot + '\examples'
Write-Host $examplespath



#get the repo name
if ($args.Length -eq 0) {
    [string]$scriptPath = (Get-Location);
    $repo_name=$scriptPath.split("\\")[-1]
    Write-Host $repo_name
} else {
    $repo_name=$args[0];
}



# initialize a git repo

git init -b main
git add .
git commit -m "initial commit"

# create a private github repo

gh repo create $repo_name  --source=. --private

git push --set-upstream origin main