#!/bin/bash 

ID=$(id -u)
Timestamp=$(date +%D-%T)

LOGFILE="/tmp/$0-$Timestamp.log"

validate(){
    if [ $1 -ne 0 ]
then 
    echo "$2 installing is failed"
    exit 1
else 
    echo "$2 installing is succesfull"
fi
}

if [ $ID -eq 0 ]
then 
    echo "you are a root user"
else 
    echo "you need to be root user to run this command"
    exit 1
fi

yum install git -y &>> $LOGFILE
validate $? git 

yum install mysql -y &>> $LOGFILE
validate $? mysql 

yum install nginx -y &>> $LOGFILE
validate $? nginx