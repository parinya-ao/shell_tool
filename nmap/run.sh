#!/bin/bash

TARGET="192.168.122.168"

echo "Scanning open ports on $TARGET..."
nmap -Pn -p 22,222,2222,1234,11223 $TARGET

# nmap -Pn -T4 -p- --open $TARGET
