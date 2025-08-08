#!bin/bash

PATH_DEFAULT="ambience"
NAME_ARCHIVE=latest.yml

echo "$PATH_DEFAULT"

find . -type d -name "$PATH_DEFAULT" | while read dir; do
    for dir do
        echo "Created archive in the path: $dir/$NAME_ARCHIVE"
        touch "$dir/$NAME_ARCHIVE"
    done
done