#!/bin/bash

ID=$(id -u)

validate(){
    if [ $? -eq 0 ]
    then 
        echo "installing is succcesful"
    else 
        echo "installing is failed"
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

validate


yum install gitk -y

validate