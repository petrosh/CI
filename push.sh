#!/bin/bash -e
REPO=$(basename `git rev-parse --show-toplevel`)
echo $REPO
# owner target repo
USR=`git remote show origin -n | grep h.URL | sed 's/.*\/\/github.com\///;s/.git$//'| cut -d'/' -f1`
echo $USR
github_cmd=$(`git config --get remote.github.url`)
echo $github_cmd
#I1="https://api.github.com/repos/"
#I2=${I1}${USR}/${REPO}
#echo $I2
#IP=$(curl "$I2")
#echo "$IP"
#svaria=${IP} | sed -n 's/"id": "\([^"]*\)"/\1/p'
#echo "$svaria"
#INDIRI = ${I1}${USR}/${REPO}/pulls/${TRAVIS_PULL_REQUEST}
#echo url $INDIRI
if [ "$TRAVIS_PULL_REQUEST" == "false" ]; then
    echo "Skipping deploy; just doing a build."
    #git fetch && git diff --name-only ..origin
    exit 0
fi
# It is a pull request
printf "**START**\n"
#I3=${TRAVIS_PULL_REQUEST}
#I4=$I2/pulls/$I3
#echo $I4
#GIP=$(curl "$I4")
#echo"$GIP"
#varia=${GIP} | sed -n 's/"user": "\([^"]*\)"/\1/p'
#output = $(curl "$I4" | sed -n 's/"user": "\([^"]*\)"/\1/p')
#echo "$output"
# fetch and diff
git fetch && git diff --name-only ..origin
printf "\n**END**"
