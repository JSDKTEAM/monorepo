#!/bin/bash -e

# folders=$(git --no-pager diff --name-only HEAD~1 | sort -u | awk 'BEGIN {FS="/"} {print $1}' | uniq); 
# echo $folders
lastcommit=`git log --format="%H" -n 1`
parentId=`git log --pretty=%P -n 1 "$lastcommit" | awk -F' ' '{print $1}'`
beforecommitId=`git log --pretty=%P -n 1 "$parentId" | awk -F' ' '{print $1}'`
echo lastcommit $lastcommit
echo beforecommitId $beforecommitId
echo parentId $parentId

changed_folders=`git diff --name-only $beforecommitId...$lastcommit | grep / | awk 'BEGIN {FS="/"} {print $1}' | uniq`
echo "changed folders "$changed_folders
