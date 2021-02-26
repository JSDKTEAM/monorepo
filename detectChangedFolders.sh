#!/bin/bash -e

# folders=$(git --no-pager diff --name-only HEAD~1 | sort -u | awk 'BEGIN {FS="/"} {print $1}' | uniq); 
# echo $folders

changed_folders=`git diff --name-only HEAD~1 | grep / | awk 'BEGIN {FS="/"} {print $1}' | uniq`
echo "changed folders "$changed_folders
