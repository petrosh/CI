printf "\n***\n"

echo prettyformat an - cn - D:
git log -p -1 --pretty=format:"%an - %cn - %D"

printf "\n***\n"

echo git status
git status

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
echo sourcebranch = $SOURCE_BRANCH
echo pr: $TRAVIS_PULL_REQUEST

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
git show SHA --name-only

printf "\n---\n"

echo Get only remote branches
git branch -r
