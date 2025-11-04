#!/bin/Bash

ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

Validate(){
    if [ $1 -eq 0 ]
then 
    echo -e "$G installing $2 successful $N"
else 
    echo -e "$R installing $2 failed $N"
    exit 1
fi
}

if [ $ID -eq 0 ]
then 
    echo -e "$G you ara a root user $N"
else 
    echo -e "$R you should run this command as a root user $N"
    exit 1
fi

yum install mysql -y

Validate $? mysql