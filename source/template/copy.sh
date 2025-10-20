#!/bin/bash
set -e

# define vars
TEMPLATE_REPO="https://github.com/janneadolf/template.git"
NEW_REPO_NAME=${1:-copy-template}
LOCAL_PATH=${2:-github/$NEW_REPO_NAME}
#REMOTE_URL=${3:-https://github.com/janneadolf/$NEW_REPO_NAME.git}

# clone template without full history
git clone --depth=1 "$TEMPLATE_REPO" "$LOCAL_PATH"

# go to new repo
cd "$LOCAL_PATH"

# remove old git history
rm -rf .git

# update local repo copy
mv template.Rproj "$NEW_REPO_NAME.Rproj" # update name R proj
rm -rf source/template # remove template files

# create remote repo (using github-cli)
#gh repo create "$NEW_REPO_NAME" --private

# create new repo
git init
git add .
git commit -m "Initial commit from template"
git branch -M main
#git remote add origin "$REMOTE_URL"
#git push -u origin main

