#!/bin/sh
set -e
SUBMODULE=$1
BRANCH=$2
[ -z "$SUBMODULE" ] \
  && echo "Usage: ./update.sh <SUBMODULE> [<BRANCH>]" \
  && echo \
  && echo "Update <SUBMODULE> to the current HEAD commit from <BRANCH>. If <BRANCH> is omitted, " \
  && echo "it defaults to the current branch of <SUBMODULE>" \
  && exit 1
cd `dirname $0`

if [ -n "$BRANCH" ]; then
  git config --file=.gitmodules submodule."$SUBMODULE".branch "$BRANCH"
  git submodule sync
fi
git submodule update --remote --merge "$SUBMODULE"
git add "$SUBMODULE"
git commit -m "Updating submodule $SUBMODULE to HEAD of $BRANCH"
git push
