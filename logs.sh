#!/bin/bash 

ID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGFILE="/tmp/$0-$TIMESTAMP.log"


validate(){
    if [ $1 -ne 0 ]
then 
    echo -e "$2 installing is $R failed $N"
    exit 1
else 
    echo -e "$2 installing is $G succesfull $N"
fi
}

if [ $ID -eq 0 ]
then 
    echo -e "$G you are a root user $N"
else 
    echo -e "$R you need to be root user to run this command $N"
    exit 1
fi

yum install git -y &>> $LOGFILE
validate $? git 

yum install mysql -y &>> $LOGFILE
validate $? mysql 

yum install nginx -y &>> $LOGFILE
validate $? nginx
