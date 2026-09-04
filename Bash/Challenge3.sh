#!/bin/bash

read -p "Enter a file: " filename

if [[ -f "$filename" ]]; then
    echo "File '$filename' exists."
    #Check if file is readable
    if [[ -r $filename ]]; then
        echo "File '$filename' is readable."
    else
        echo "File '$filename' is not readable."
    fi
    #Check if file is writable
    if [[ -w $filename ]]; then
        echo "File '$filename' is writable."
    else
        echo "File '$filename' is not writable."
    fi
    #Check if file is executable
    if [[ -x $filename ]]; then
        echo "File '$filename' is executable."
    else
        echo "File '$filename' is not executable."
    fi 
else
    echo "File '$filename' does not exist."
fi