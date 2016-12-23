git log
echo GITHUB_URL ${GITHUB_URL:-`git config remote.origin.url`}
echo REPO ${REPO/https:\/\/github.com\//git@github.com:}
echo branch $TRAVIS_BRANCH
echo pr $TRAVIS_PULL_REQUEST
