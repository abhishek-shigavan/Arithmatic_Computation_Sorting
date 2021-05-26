#!/bin/bash -x

counter=0

read -p " Enter 1st Number " a
read -p " Enter 2nd Number " b
read -p " Enter 3rd Number " c

declare -A arithmaticOperation_dictonary

declare -a arithmaticOperation_array

arithmaticOperation1=`awk "BEGIN {print $a + $b * $c}"`
arithmaticOperation2=`awk "BEGIN {print $a * $b + $c}"`

arithmaticOperation3=`awk "BEGIN {print $c + $a / $b}"`
arithmaticOperation3=${arithmaticOperation3%.*}

arithmaticOperation4=`awk "BEGIN {print $a % $b + $c}"`

arithmaticOperation_dictonary["a+b*c"]="$arithmaticOperation1"
arithmaticOperation_dictonary["a*b+c"]="$arithmaticOperation2"
arithmaticOperation_dictonary["c+a/b"]="$arithmaticOperation3"
arithmaticOperation_dictonary["a%b+c"]="$arithmaticOperation4"

for key in ${!arithmaticOperation_dictonary[@]}
do
        arithmaticOperation_array[$counter]=${arithmaticOperation_dictonary[$key]}
        ((counter++))
done

descending_array=($(echo ${arithmaticOperation_array[@]}|tr " " "\n" |sort -nr))

echo " Computation Result in Descending Order : ${descending_array[@]} "
