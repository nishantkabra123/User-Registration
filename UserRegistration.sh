#!/bin/bash -x
shopt -s extglob
read -p "Enter Last Name : " name

pat='^[A-Z]{1}[a-z]{2,}$'

if [[ $name =~ $pat ]]
then
    echo "Yes"
else
    echo "No"
fi


