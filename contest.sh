#!/bin/bash

# Older script to create contests.

mkdir $1
cd $1
alpha="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
for ((i = 0; i < $2; i++)); do
    mkdir "${alpha:$i:1}"
done

for Problem in *; do
    cd $Problem
    cp ~/code/temp.cpp sol.cpp
    cd ..
done