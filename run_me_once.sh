#!/bin/bash
if [[ -z $REPO ]]; then
  echo -e "
${RED}Error usage unset${NO_COLOR}
Usage:

  REPO=your_git_repo ./run_me_once.sh
"
fi

echo "Removing .git"
# rm -rf .git

echo "Initializing new repo"
git init

echo "Adding new remote"

git remote add origin $REPO

echo "Adding new repo data"
git add .

git commit -m "Initial commit"

echo "Force pushing to master in 5 seconds"
sleep 5
git push origin master --force

echo "Installing frontend dependencies..."
cd client/ && npm install && cd js_src && npm install --dev

Echo "Congrats! Enjoy an awesome dev setup."
