#!/bin/bash -e
REPO=$(basename `git rev-parse --show-toplevel`)
echo $REPO
# owner target repo
USR=`git remote show origin -n | grep h.URL | sed 's/.*\/\/github.com\///;s/.git$//'| cut -d'/' -f1`
echo $USR
echo travisslug
git config --local travis.slug
echo ls-remote:
git ls-remote --get-url
git ls-remote --get-url origin
echo basename
basename $(git config --get remote.$(git config --get branch.master.remote).url) .git
echo "-l"
git config -l
echo space
git config --get remote.$(git config --get branch.master.remote).url
echo mail
LOCAL_BRANCH=`git name-rev --name-only HEAD`
TRACKING_BRANCH=`git config branch.$LOCAL_BRANCH.merge`
echo "$TRACKING_BRANCH"
echo vv
#git config --get remote.github.url
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
git branch -vv
git fetch origin refs/pull/$TRAVIS_PULL_REQUEST/head:sicuro
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
