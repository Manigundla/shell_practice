#!/bin/bash

ID=$(id -u)

if[ $ID -eq 0]
then echo (you are not a sudo user)