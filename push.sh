git log -p -2 --pretty=format:"%h - %an, %ar : %s"
git log -p -2 --name-only
echo GITHUB_URL ${GITHUB_URL:-`git config remote.origin.url`}
echo REPO ${REPO}
echo branch $TRAVIS_BRANCH
echo pr $TRAVIS_PULL_REQUEST
SHA=`git rev-parse --verify HEAD`
echo $SHA

