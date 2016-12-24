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

echo trackedfiles: ${git ls-files -t}
echo branch: $TRAVIS_BRANCH
echo sourcebranch = $SOURCE_BRANCH
echo pr: $TRAVIS_PULL_REQUEST

printf "\n---\n"

REPO=`git config remote.origin.url`
SSH_REPO=${REPO}
echo repo $REPO $SSH_REPO

printf "\n---\n"

echo Get list of all remote references
git remote
