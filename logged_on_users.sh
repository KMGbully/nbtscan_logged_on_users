#!/bin/bash
if [ -z "$1" ]; then 
  echo "[*] Usage:  ./logged_on_users.sh <filename with ip addresses>"
  exit 0
fi
for scan in $(cat $1); do results=$(nbtscan -vq $scan | grep "03"); if [ ! -z "$results" ]; then user=$(echo $results | awk '{print $4}') && pc=$(echo $results | awk '{print $1}'); echo User $user logged onto $pc; fi; done

