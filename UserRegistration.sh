#!/bin/bash 
shopt -s extglob

printf " 1.FirstName \n 2.LastName \n 3.Email \n 4.Mobile No \n 5.Password with min 8 chars \n 6.Password with atleast 1 upper case \n 7.Password with atleast 1 upper case and number \n"
read -p "enter number : " choice 
read -p "Enter test input : " word

firstNameRegex='^[A-Z]{1}[a-z]{2,}$'
LastNameRegex='^[A-Z]{1}[a-z]{2,}$'
emailRegex='^[a-zA-Z0-9]+([._+-][a-zA-Z0-9]+)*@[a-zA-Z0-9]+[.]{1}[a-z]{2,3}([.][a-z]{2})*$'
mobileRegex='^[0-9]{2}[ ][0-9]{10}$'
passwordRegex1='^.{8,}$'
passwordRegex2='^(((.)*[A-Z]+)|([A-Z]+(.)*))+$'
passwordRegex3='^(((.)*[A-Z]+[0-9]+)|((.)*[0-9]+[A-Z]+)|([0-9]+[A-Z]+(.)*)|([A-Z]+[0-9]+(.)*)|([A-Z]+(.)*[0-9]+)|([0-9]+(.)*[A-Z]+))+$'

function testPattern(){

if [[ $1 =~ $2 ]]
then
    echo "Yes"
else
    echo "No"
fi

}

function passwordUpperCase(){
regex=$1    
password=$2
passwordLength=${#password}
if [[ $regex =~ $password && $passwordLength -ge 8 ]]  #if password matches atleast 1 UpperCase and length>=8
then
    echo "Yes"
else
    echo "No"
fi
}
function passwordUpperCaseAndNumber(){
regex=$1    
password=$2
passwordLength=${#password}
if [[ $regex =~ $password && $passwordLength -ge 8 ]]  #if password matches atleast 1 UpperCase and Number and length>=8
then
    echo "Yes"
else
    echo "No"
fi
}

if [ $choice -eq 1 ]
then
    testPattern $firstNameRegex $word
elif [ $choice -eq 2 ]
then
    testPattern $lastNameRegex $word
elif [ $choice -eq 3 ]
then
    testPattern $emailRegex $word
elif [ $choice -eq 4 ]
then
    testPattern $mobileRegex $word
elif [ $choice -eq 5 ]
then
    testPattern $passwordRegex1 $word
elif [ $choice -eq 6 ]
then
    passwordUpperCase $passwordRegex2 $word
elif [ $choice -eq 7 ]
then
    passwordUpperCaseAndNumber $passwordRegex3 $word
fi




