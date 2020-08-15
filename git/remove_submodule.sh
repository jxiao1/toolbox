#!/usr/bin/env bash
#
THISDIR="$(dirname $(readlink -f $0))"
GITTOP="$(git rev-parse --show-toplevel)"

if [ -z "$1" -o "$1" == "-h" -o "$1" == "--help" ] ; then
    echo "Usage: $(basename $0) <submodule-path>"  && exit 1
else
    SUBMODULE=$1
fi

git submodule deinit $SUBMODULE
git rm --cached $SUBMODULE
rm -rf .git/modules/$SUBMODULE
rm -rf $SUBMODULE
echo "$SUBMODULE is removed"
echo -e "\n!!! Please remove the submode in .gitmodules file manually"
cat $GITTOP/.gitmodules
