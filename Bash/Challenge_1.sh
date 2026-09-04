#!/bin/bash

read -p "Enter a number: " num1
read -p "Enter another number: " num2

sum=$((num1 + num2))
echo "The sum of $num1 and $num2 is: $sum"

multiply=$((num1 * num2))
echo "The product of $num1 and $num2 is: $multiply"

subtract=$((num1 - num2))
echo "The difference when $num2 is subtracted from $num1 is: $subtract"

divide=$((num1 / num2))
echo "The result when $num1 is divided by $num2 is: $divide"

