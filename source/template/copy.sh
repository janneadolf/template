

#!/bin/bash
set -e

TEMPLATE_REPO="https://github.com/janneadolf/test-template.git"
NEW_REPO_NAME=${1:-copy-template}
LOCAL_PATH=${2:-github/$NEW_REPO_NAME}
#REMOTE_URL=${3:-https://github.com/janneadolf/$NEW_REPO_NAME.git}

# Clone template without full history
git clone --depth=1 "$TEMPLATE_REPO" "$LOCAL_PATH"

cd "$LOCAL_PATH"

# Remove old Git history
rm -rf .git

# Update local copy
mv test-template.Rproj "$NEW_REPO_NAME.Rproj" # update name R proj
rm -rf source/template

# create remote repo (github-cli)
#gh repo create "$NEW_REPO_NAME" --private


# create new repo
git init
git add .
git commit -m "Initial commit from template"
git branch -M main
#git remote add origin "$REMOTE_URL"
#git push -u origin main


# run script
#bash github\test-template\test\copy.sh
