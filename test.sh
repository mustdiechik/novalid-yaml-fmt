#!/bin/bash

IFS=""
IN_FILES=$(find tests/ -type f | grep '\.in$' | sort )

echo "$IN_FILES" | while read IN_FILE
do
    echo ">>> $IN_FILE"
    OUT_FILE=$(echo $IN_FILE | sed 's/\(.*\)\(\.in\)$/\1\.out/g')

    if [ ! -f "$OUT_FILE" ]; then
        OUT_FILE=$IN_FILE
    fi

    cat $IN_FILE | ./novalid-yaml-fmt | diff $OUT_FILE -

done
