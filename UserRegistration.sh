#!/bin/bash -x
shopt -s extglob
read -p "Enter password : " password

pat='^.{8,}$'

if [[ $password =~ $pat ]]
then
    echo "Yes"
else
    echo "No"
fi


