#!/bin/bash

# Run sample tests and diff their output against correct output.

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
CYAN="\e[36m"
GRAY="\e[90m"
ENDCOLOR="\e[0m"

CURRENT_DIR=$PWD
EXECUTABLE=$1
TEST=1
SUCCESS=0

for INPUT in $EXECUTABLE*.in
do
    echo -e "${GRAY}Running test ${TEST} ${ENDCOLOR}"

    N_TEST=${INPUT:2:1}
    MY_OUTPUT="$CURRENT_DIR/$EXECUTABLE-$N_TEST.myout"
    EXPECTED_OUTPUT="$EXECUTABLE-${N_TEST}.out"

    "./$EXECUTABLE" < $INPUT > "$MY_OUTPUT"

    cat $INPUT
    echo -e "${GRAY}Test ${TEST} output:${ENDCOLOR}"
    cat "$MY_OUTPUT"
    echo -e "${GRAY}Expected output: ${ENDCOLOR}"
    cat "$EXPECTED_OUTPUT"
    echo -e "================================="

    DIFF=$(diff $MY_OUTPUT $EXPECTED_OUTPUT)
    if [ "$DIFF" == "" ]
        then
            SUCCESS=$((SUCCESS+1))
    fi
    TEST=$((TEST+1))
done

TEST=$((TEST-1))
if [[ "$SUCCESS" -eq "$TEST" ]]; then
    echo -e "${GREEN}AC: ${SUCCESS} / ${TEST} tests passed. ${ENDCOLOR}"
else
    echo -e "${RED}WA: ${SUCCESS} / ${TEST} tests passed. ${ENDCOLOR}"
fi