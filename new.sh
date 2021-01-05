#!/bin/sh
set -e
set -u
VERSION=$1
cd `dirname $0`/..
echo $PWD
cd simulations
git checkout -b $VERSION
echo git push -u origin $VERSION
cd ../tioxaxis.github.io
git submodule add -b $VERSION https://github.com/tioxaxis/simulations.git $VERSION
git submodule init
git add $VERSION
git commit -m "New version $VERSION"
echo git push
