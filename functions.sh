#!/bin/bash

ID=$(id -u)

validate(){
    if [ $1 -eq 0 ]
    then 
        echo "$2 installing is succcesful"
    else 
        echo "$2 installing is failed"
        exit 1
    fi
}

if [ $ID -eq 0 ]
then 
    echo "you are a sudo user"
else
    echo "you should be a sudo user to run this cmd"
    exit 1
fi

yum install nginx -y

validate $? nginx

yum install git -y

validate $? git