#!/bin/bash 

ID=$(id -u)
Timestamp=$(date +%D-%T)
Log_files=/tmp/$Timestamp.log

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
    echo "you need to be root user to run thid command"
    exit 1
fi

yum install git -y &>> Log_files
validate $? git 

yum install mysqlll -y &>> Log_files
validate $? mysql 

yum install nginx -y &>> Log_files
validate $? nginx