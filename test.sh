#!/bin/bash
set -e
IFS=""
IN_FILES=$(find tests/ -type f | grep '\.in$' | sort )

[[ "$1" ]] && IN_FILES=$1

echo "$IN_FILES" | while read IN_FILE

do
    echo ">>> $IN_FILE"
    OUT_FILE=$(echo $IN_FILE | sed 's/\(.*\)\(\.in\)$/\1\.out/g')

    if [ ! -f "$OUT_FILE" ]; then
        OUT_FILE=$IN_FILE
    fi

    cat $IN_FILE | ./novalid-yaml-fmt | diff -u --horizon-lines=2 - $OUT_FILE

    cat $OUT_FILE | ./novalid-yaml-fmt | diff -u --horizon-lines=2 - $OUT_FILE
done
