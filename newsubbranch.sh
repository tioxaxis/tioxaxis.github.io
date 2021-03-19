#!/bin/sh
set -e
VERSION=$1
COMMIT=$2
[ -z "$VERSION" ] && echo "Usage: ./new.sh <VERSION> [<COMMIT>]" && exit 1
cd `dirname $0`/..

# Create a new branch and submodule.
cd simulations
git checkout -b $VERSION $COMMIT
git push -u origin $VERSION

cd ../tioxaxis.github.io
git submodule add -b $VERSION https://github.com/tioxaxis/simulations.git $VERSION
git submodule init
git add $VERSION
git commit -m "New version $VERSION"
git push
