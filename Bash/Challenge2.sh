#!/bin/bash

mkdir bash_demo
echo "Directory 'bash_demo' created."
cd bash_demo

touch demo.txt
echo "File 'demo.txt' created."
current_date=$(date +%Y-%m-%d)
echo "This file was created by a Bash script on $current_date" > demo.txt
