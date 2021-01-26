#!/bin/bash

# Used to clear binaries and local output files before committing files to git.

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
CYAN="\e[36m"
GRAY="\e[90m"
ENDCOLOR="\e[0m"

CURRENT_DIR=$PWD

EXECUTABLES=$(find $CURRENT_DIR -executable -type f)
if [ "$EXECUTABLES" != "" ]
    then
        rm $EXECUTABLES
        echo -e "${GREEN}Binaries cleared successfully.${ENDCOLOR}"
    else
        echo -e "${RED}No binaries.${ENDCOLOR}"
fi

# MY_OUTPUT=$(find $CURRENT_DIR -name "*.myout")
# if [ "$MY_OUTPUT" != "" ]
#     then
#         rm $MY_OUTPUT
#         echo -e "${GREEN}Output files cleared successfully.${ENDCOLOR}"
#     else
#         echo -e "${RED}No output files.${ENDCOLOR}"
# fi
