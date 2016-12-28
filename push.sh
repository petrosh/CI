#!/bin/bash -e

#echo travisslug
#git config --local travis.slug
#echo ls-remote:
#git ls-remote --get-url
#git ls-remote --get-url origin
#echo basename:
#basename $(git config --get remote.$(git config --get branch.master.remote).url) .git
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
if [ "$TRAVIS_PULL_REQUEST" != "false" ]; then
    printf "**START**\n"
    # git fetch && git diff --name-only ..origin
    SHA=`git rev-parse --verify HEAD`
    echo SHA: $SHA
    echo TRAVIS_BRANCH: ${TRAVIS_BRANCH}
    echo TRAVIS_PULL_REQUEST_BRANCH: ${TRAVIS_PULL_REQUEST_BRANCH}
    echo TRAVIS_SOURCE_BRANCH: ${TRAVIS_SOURCE_BRANCH}
    printf "\n**FILES**"
    git diff --name-only ..origin
    REPO=$(basename `git rev-parse --show-toplevel`)
    echo REPO: $REPO
    git clone $REPO
    echo TRAVIS_REPO_SLUG: $TRAVIS_REPO_SLUG
    # owner target repo
    USR=`git remote show origin -n | grep h.URL | sed 's/.*\/\/github.com\///;s/.git$//'| cut -d'/' -f1`
    echo USR: $USR
    echo prettyformat an - cn:
    git log -p -1 --pretty=format:"%aN - %cN"
    printf "\n**END**"
    exit 0
fi
# It is a pull request
#git branch -vv
#git fetch origin refs/pull/$TRAVIS_PULL_REQUEST/head:sicuro
#I3=${TRAVIS_PULL_REQUEST}
#I4=$I2/pulls/$I3
#echo $I4
#GIP=$(curl "$I4")
#echo"$GIP"
#varia=${GIP} | sed -n 's/"user": "\([^"]*\)"/\1/p'
#output = $(curl "$I4" | sed -n 's/"user": "\([^"]*\)"/\1/p')
#echo "$output"
# fetch and diff
