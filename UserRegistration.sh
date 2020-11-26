#!/bin/bash -x
shopt -s extglob
read -p "Enter mobile No : " mobileNo

pat='^[0-9]{2}[ ][0-9]{10}$'

if [[ $mobileNo =~ $pat ]]
then
    echo "Yes"
else
    echo "No"
fi


