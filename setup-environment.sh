#!/bin/bash

COLOR="\033[0;33m"
RED="\033[0;31m"
NOCOLOR="\033[0m"
TEMP_HOME_FILE=./config/home.temp
TEMP_USER_FILE=./config/user.temp

function set_parameter {
  read -p "$1 [$2]?: " -r
  if [ -z "$REPLY" ]
  then
    echo $2
  else 
    echo $REPLY
  fi
}

# Get root privileges
if [ "$UID" -ne 0 ]
then 
  echo $HOME > $TEMP_HOME_FILE
  echo $USER > $TEMP_USER_FILE
  exec sudo "$0" "$@"
fi

USER_HOME=$(cat $TEMP_HOME_FILE)
RUNNING_USER=$(cat $TEMP_USER_FILE)

rm $TEMP_HOME_FILE
rm $TEMP_USER_FILE

for file in ./scripts/*
do
  software_name=$(basename "$file")
  read -p "Do you want to install $software_name [y/N]? " -r
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
    echo -e "${COLOR}Installing $software_name...${NOCOLOR}"
    source "$file"
    echo -e "${COLOR}Done!${NOCOLOR}"
  fi
done