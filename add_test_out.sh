#!/bin/bash

# Simple cat to add additional custom test cases.

CURRENT_DIR=$PWD
EXECUTABLE=$1
TESTS=1

for INPUT in $EXECUTABLE*.out
do
    TESTS=$((TESTS+1))
done

NEW_TEST="$CURRENT_DIR/$EXECUTABLE-$TESTS.out"
cat > "$NEW_TEST"