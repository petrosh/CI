#!/bin/bash -e
REPO=$(basename `git rev-parse --show-toplevel`)
echo $REPO
# owner target repo
USR=`git remote show origin -n | grep h.URL | sed 's/.*\/\/github.com\///;s/.git$//'| cut -d'/' -f1`
echo $USR
echo TRIGGER_REPO $TRIGGER_REPO
echo TRIGGER_COMMIT $TRIGGER_COMMIT
if [ "$TRAVIS_PULL_REQUEST" == "false" ]; then
    echo "Skipping deploy; just doing a build."
    git fetch && git diff --name-only ..origin
    exit 0
fi

printf "**START**\n"
git config
# pull guy
echo PR_USER: ${PR_USER:-`git log -1 --pretty=format:"%an"`}
git remote -v
# fetch and diff
git fetch && git diff --name-only ..origin
echo show origin
git remote show origin
echo config remote url
git config --get remote.origin.url
URL = https://api.github.com/repos/$USR/$REPO/pulls/$TRAVIS_PULL_REQUEST
echo url $URL
curl $URL | sed -n 's/"filename": "\([^"]*\)"/\1/p'

echo TRAVIS_BRANCH: ${TRAVIS_BRANCH}
SOURCE_BRANCH="master"
# It is a pull request
# Save some useful information
REPO=`git config remote.origin.url`
echo config $REPO
SSH_REPO=${REPO/https:\/\/github.com\//git@github.com:}
SHA=`git rev-parse --verify HEAD`
# Clone the existing branch for this repo into the same
# Create a new empty branch if builds doesn't exist yet (should only happen on first deply)
echo Tprbranch $TRAVIS_PULL_REQUEST_BRANCH

printf "\n**END**"
