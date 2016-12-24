echo prettyformat h:
git log -p -1 --pretty=format:"%h"

SHA=`git rev-parse --verify HEAD`
echo SHA: $SHA

echo difftree:
git diff-tree --no-commit-id --name-only -r $SHA

echo pr:
$TRAVIS_PULL_REQUEST
