#!/bin/bash

COLOR="\033[0;33m"
NOCOLOR="\033[0m"

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
[ "$UID" -eq 0 ] || exec sudo "$0" "$@"

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