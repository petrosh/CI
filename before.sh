#!/bin/bash -e

echo TRIGGER_REPO $TRIGGER_REPO
echo TRIGGER_COMMIT $TRIGGER_COMMIT
cd `echo $TRIGGER_REPO | sed 's|[^/]*/||'` # Strip the user / org from the repo slug
git fetch
git checkout $TRIGGER_COMMIT
