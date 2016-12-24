printf "\n***\n"

echo prettyformat an - cn - D:
git log -p -1 --pretty=format:"%an - %cn"

printf "\n***\n"

echo log namestatus
git log -p -1 --name-status

printf "\n***\n"

echo cached
git diff --cached --name-only

printf "\n***\n"

echo prettyformat commit hash H:
git log -1 --pretty=format:"%H"

printf "\n---\n"

SHA=`git rev-parse --verify HEAD`
echo SHA: $SHA

echo List of all files changed in a commit
git diff-tree --no-commit-id --name-only -r $SHA

printf "\n---\n"

echo difftree:
git diff-tree --no-commit-id --name-only -r $SHA

printf "\n---\n"

echo trackedfiles
git ls-files -t

printf "\n---\n"

echo branch: $TRAVIS_BRANCH
echo sourcebranch: $TRAVIS_SOURCE_BRANCH
echo pr: $TRAVIS_PULL_REQUEST
echo PRbranch: $TRAVIS_PULL_REQUEST_BRANCH

printf "\n---\n"

REPO=`git config remote.origin.url`
SSH_REPO=${REPO}
echo repo $REPO $SSH_REPO

echo GITHUB_URL ${GITHUB_URL:-`git config remote.origin.url`}
printf "\n---\n"

echo Get list of all remote references
git remote

printf "\n---\n"

echo show sha nameonly
git show $SHA --name-only

printf "\n---\n"

echo Get only remote branches
git branch -r

echo CHECKOUT...
git fetch origin refs/pull/$TRAVIS_PULL_REQUEST/head:prova
