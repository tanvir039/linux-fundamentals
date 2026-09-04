#!/bin/bash

score=4

if [ $score -ge 90 ]
then
    echo "Excellent"
elif [ $score -ge 80 ]
then 
    echo "Good"
else
    echo "Poor"
fi