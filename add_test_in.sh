#!/bin/bash

# Simple cat to add additional custom test cases.

CURRENT_DIR=$PWD
EXECUTABLE=$1
TESTS=1

for INPUT in $EXECUTABLE*.in
do
    TESTS=$((TESTS+1))
done

NEW_TEST="$CURRENT_DIR/$EXECUTABLE-$TESTS.in"
cat > "$NEW_TEST"