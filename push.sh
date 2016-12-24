echo prettyformat
git log -p -1 --pretty=format:"%h - %an or %cn, %ar : %s"
echo namestatus
git log -p -1 --name-status
echo GITHUB_URL ${GITHUB_URL:-`git config remote.origin.url`}
echo TRAVIS $TRAVIS
echo branch $TRAVIS_BRANCH
echo pr $TRAVIS_PULL_REQUEST
SHA=`git rev-parse --verify HEAD`
echo SHA $SHA
echo difftree
git diff-tree --no-commit-id --name-only -r $SHA
