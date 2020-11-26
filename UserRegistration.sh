#!/bin/bash -x
shopt -s extglob
read -p "Enter email : " email

pat='^[a-zA-Z0-9]+([._+-][a-zA-Z0-9]+)*@[a-zA-Z0-9]+[.]{1}[a-z]{2,3}([.][a-z]{2})*$'

if [[ $email =~ $pat ]]
then
    echo "Yes"
else
    echo "No"
fi


