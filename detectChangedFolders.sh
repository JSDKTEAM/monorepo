#!/bin/bash -e

folders=$(git --no-pager diff --name-only HEAD~1 | sort -u | awk 'BEGIN {FS="/"} {print $1}' | uniq); 
for j in "${folders[@]}"
    do
        echo $j
        if [[ $i = $j ]]; then
            SHOULD_BUILD=1 
        fi
done
