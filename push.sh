#!/bin/bash -e
REPO=$(basename `git rev-parse --show-toplevel`)
echo $REPO
# owner target repo
USR=`git remote show origin -n | grep h.URL | sed 's/.*\/\/github.com\///;s/.git$//'| cut -d'/' -f1`
echo $USR
INDIRI = 'https://api.github.com/repos/${USR}/${REPO}/pulls/${TRAVIS_PULL_REQUEST}'
echo url $INDIRI
if [ "$TRAVIS_PULL_REQUEST" == "false" ]; then
    echo "Skipping deploy; just doing a build."
    git fetch && git diff --name-only ..origin
    exit 0
fi
# It is a pull request
printf "**START**\n"
# fetch and diff
git fetch && git diff --name-only ..origin

output = $(curl "https://api.github.com/repos/${USR}/${REPO}/pulls/${TRAVIS_PULL_REQUEST}" | sed -n 's/"user": "\([^"]*\)"/\1/p')
echo output

echo TRAVIS_BRANCH: ${TRAVIS_BRANCH}
SOURCE_BRANCH="master"
printf "\n**END**"
