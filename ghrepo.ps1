#get the repo name
if ($args.Length -eq 0) {
    Write-Host "No repo name specified" -ForegroundColor Red
    exit 1
}

$repo_name=$args[0];

# initialize a git repo

git init -b main
git add .
git commit -m "initial commit"

# create a private github repo

gh repo create $repo_name  --source=. --private

git push --set-upstream origin main