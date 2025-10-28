#!/bin/bash

ID=$(id -u)

if [ $ID -eq 0 ]
then 
    echo "you are a sudo user"
else
    echo "you should be a sudo user to run this cmd"
    exit 1
fi

yum install nginx -y

if [ $? -eq 0 ]
then 
    echo "installing nginx is succcesful"
else 
    echo "installing nginx is failed"
    exit 1
fi