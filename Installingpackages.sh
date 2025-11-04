#!/bin/Bash

ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $ID eq 0 ]
then 
    echo "$G you ara a root user $N"
else 
    echo "$R you should run this command as a root user $N"
    exit 1
fi