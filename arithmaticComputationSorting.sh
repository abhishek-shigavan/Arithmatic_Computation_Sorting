#!/bin/bash -x

read -p " Enter 1st Number " a
read -p " Enter 2nd Number " b
read -p " Enter 3rd Number " c

arithmaticOperation1=`awk "BEGIN {print $a + $b * $c}"`
arithmaticOperation2=`awk "BEGIN {print $a * $b + $c}"`

arithmaticOperation3=`awk "BEGIN {print $c + $a / $b}"`
arithmaticOperation3=${arithmaticOperation3%.*}

