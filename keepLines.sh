#!/bin/sh

LINES_TO_KEEP="3 5"

MERGED_FILE=$(mktemp)

while IFS= read -r line || [ -n "$line" ]; do
    LINENUM=$((${LINENUM:-0} + 1))

    if echo $LINES_TO_KEEP | grep -w $LINENUM > /dev/null; then
        sed -n "${LINENUM}p" $2 >> $MERGED_FILE
    else
        sed -n "${LINENUM}p" $3 >> $MERGED_FILE
    fi
done < $1

cp -f $MERGED_FILE $3

rm $MERGED_FILE