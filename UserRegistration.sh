#!/bin/bash 
shopt -s extglob

echo "User Registration"
printf " 1.FirstName \n 2.LastName \n 3.Email \n 4.Mobile No \n 5.Password with min 8 chars \n 6.Password with atleast 1 upper case \n 7.Password with atleast 1 upper case and number \n 8.Password with atleast 1 upper case and number and 1 special character \n"
read -p "enter number : " choice 
read -p "Enter test input : " word

firstNameRegex='^[A-Z]{1}[a-z]{2,}$'
LastNameRegex='^[A-Z]{1}[a-z]{2,}$'
emailRegex='^[a-zA-Z0-9]+([._+-][a-zA-Z0-9]+)*@[a-zA-Z0-9]+[.]{1}[a-z]{2,3}([.][a-z]{2})?$'
mobileRegex='^[0-9]{2}[ ][0-9]{10}$'
passwordRegex1='^.{8,}$' #password with minimum 8 characters
passwordRegex2='^(((.)*[A-Z]+)|([A-Z]+(.)*))+$' #password with atleast 1 uppercase
passwordRegex3='^(((.)*[A-Z]+[0-9]+)|((.)*[0-9]+[A-Z]+)|([0-9]+[A-Z]+(.)*)|([A-Z]+[0-9]+(.)*)|([A-Z]+(.)*[0-9]+)|([0-9]+(.)*[A-Z]+))+$' #password with atleast 1 uppercase and number
passwordRegex4='^[a-zA-Z0-9]*[^a-z^A-Z^0-9]{1}|[^a-z^A-Z^0-9]{1}[a-zA-Z0-9]*$' #password with exact 1 special character

function testPattern(){

if [[ $1 =~ $2 ]]
then
    echo "Yes"
else
    echo "No"
fi

}

function testPassword(){
regex=$1            #If password matches atleast 1 UpperCase and 1 Number
password=$2
passwordLength=${#password}
if [[ $regex =~ $password && $passwordLength -ge 8 ]]  #if password length>=8
then
    echo "Yes"
else
    echo "No"
fi
}
function passwordSpecialChar(){
regex=$1            #If password matches atleast 1 UpperCase and 1 Number
password=$2
passwordLength=${#password}
if [[ $regex =~ $password && $passwordRegex4 =~ $password && $passwordLength -ge 8 ]]  #if password length>=8
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
    testPassword $passwordRegex2 $word
elif [ $choice -eq 7 ]
then
    testPassword $passwordRegex3 $word
elif [ $choice -eq 8 ]
then
    passwordSpecialChar $passwordRegex3 $word
fi




