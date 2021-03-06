#!/bin/bash
if [ -z "$1" ]; then 
  echo "[*] Usage:  ./logged_on_users.sh <filename with ip addresses>"
  exit 0
fi
for scan in $(cat $1); do 
  results=$(nbtscan -vq $scan | grep "03" | awk '{print $1}')
 if [ ! -z "$results" ]; then
   user=$(nbtscan -q $scan | awk '{print $4}')
   echo $(tput setaf 3)User $user logged onto $scan $(tput setaf 7)
 fi
done
