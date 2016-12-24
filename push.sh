printf "\n***\n"

echo prettyformat an - cn:
git log -p -1 --pretty=format:"%an - %cn"

printf "\n---\n"

SHA=`git rev-parse --verify HEAD`
echo SHA: $SHA

printf "\n---\n"

echo difftree:
git diff-tree --no-commit-id --name-only -r $SHA

printf "\n---\n"

echo branch: $TRAVIS_BRANCH

echo pr: $TRAVIS_PULL_REQUEST
