REPO=$(basename `git rev-parse --show-toplevel`)
echo $REPO
USR=`git remote show origin -n | grep h.URL | sed 's/.*\/\/github.com\///;s/.git$//'| cut -d'/' -f1`
echo $USR
echo https://api.github.com/${USR}/${REPO}/pulls/${TRAVIS_PULL_REQUEST}

printf "**START**\n"
#echo PR_USER: ${PR_USER:-`git log -1 --pretty=format:"%an"`}

# Pull requests and commits to other branches shouldn't try to deploy, just build to verify
if [ "$TRAVIS_PULL_REQUEST" == "false" ]; then
    echo "Skipping deploy; just doing a build."
    exit 0
fi
echo TRAVIS_BRANCH: ${TRAVIS_BRANCH}
SOURCE_BRANCH="master"
# It is a pull request
# Save some useful information
REPO=`git config remote.origin.url`
SSH_REPO=${REPO/https:\/\/github.com\//git@github.com:}
SHA=`git rev-parse --verify HEAD`
# Clone the existing branch for this repo into the same
# Create a new empty branch if builds doesn't exist yet (should only happen on first deply)
echo Tprbranch $TRAVIS_PULL_REQUEST_BRANCH

printf "\n**END**"

echo CHECKOUT...
git fetch origin refs/pull/$TRAVIS_PULL_REQUEST/head:$TRAVIS_PULL_REQUEST_BRANCH
git clone $REPO builds
cd builds
git checkout $TARGET_BRANCH || git checkout --orphan $TARGET_BRANCH
cd ..
ls

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

# SSH_REPO=${REPO}
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
