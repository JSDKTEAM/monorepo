#!/bin/bash -e

# folders=$(git --no-pager diff --name-only HEAD~1 | sort -u | awk 'BEGIN {FS="/"} {print $1}' | uniq); 
# echo $folders

changed_folders=`git diff --name-only HEAD~1 | grep / | awk 'BEGIN {FS="/"} {print $1}' | uniq`
for folder in $changed_folders
 do
   if [ "$folder" == '_global' ]; then
     echo "common folder changed, building and publishing all microservices"
     changed_services=`find . -maxdepth 1 -type d -not -name '_global' -not -name 'shippable' -not -name '.git' -not -path '.' | sed 's|./||'`
     echo "list of microservice "$changed_services
     break
   else
     echo "Adding $folder to list of services to build"
   fi
 done
echo "changed folders "$changed_folders
