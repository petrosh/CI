git log -p -2 --pretty=format:"%h - %an or %cn, %ar : %s"
echo name-only
git log -p -2 --name-only
echo name-status
git log -p -1 --name-status
echo GITHUB_URL ${GITHUB_URL:-`git config remote.origin.url`}
echo REPO ${REPO}
echo branch $TRAVIS_BRANCH
echo pr $TRAVIS_PULL_REQUEST
SHA=`git rev-parse --verify HEAD`
echo SHA $SHA
