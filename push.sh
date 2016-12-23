git log
echo GITHUB_URL ${GITHUB_URL:-`git config remote.origin.url`}
echo REPO $REPO
echo branch $TRAVIS_BRANCH
echo pr $TRAVIS_PULL_REQUEST
SHA=`git rev-parse --verify HEAD`
echo $SHA

