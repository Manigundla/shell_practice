#!/bin/Bash

ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
Timestamp=$(date +%F-%H-%M-%S) 
Log_files="/tmp/$0-$Timestamp.log"

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

for package in $@
do 
    yum list avaliable $package
    if [ $? -eq 0 ]
    then 
        echo "$package already installed.. $Y skipping $N" &>> $Log_files
    else 
        yum install $package -y &>> $Log_files
        Validate $? $package
    fi
done 

