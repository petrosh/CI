printf "\n***\n"

echo prettyformat an - cn - D:
git log -p -1 --pretty=format:"%an - %cn - %D"

printf "\n***\n"

echo prettyformat commit hash H:
git log -p -1 --pretty=format:"%H"

printf "\n---\n"

SHA=`git rev-parse --verify HEAD`
echo SHA: $SHA

echo List of all files changed in a commit
git diff-tree --no-commit-id --name-only -r $SHA

printf "\n---\n"

echo difftree:
git diff-tree --no-commit-id --name-only -r $SHA

printf "\n---\n"

echo branch: $TRAVIS_BRANCH

echo pr: $TRAVIS_PULL_REQUEST
