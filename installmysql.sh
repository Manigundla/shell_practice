#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then 
    echo  "you are not a root user"
    exit 1
    echo "you are root user"
fi

yum install mysql -y

if [ $? -eq 0 ]
then    
    echo "installing mysql is successful"
else 
    echo "installing is failure"
    exit 1
fi    