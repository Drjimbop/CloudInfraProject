#!/bin/bash

#Calling file variable
files=(
'/etc/shadow'
'/etc/passwd'
)

#Identify for file permissions
for files in ${files[@]}
do
ls -lah $files
done

#Sudo abilities for users in home folder
for user in $(/home)
do
sudo -lU $user
done
