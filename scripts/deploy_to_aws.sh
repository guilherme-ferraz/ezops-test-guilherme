#!/bin/bash

echo "$1" > cert.pem
chmod 400 cert.pem
mkdir -p ~/.ssh/
chmod 700 ~/.ssh/
ssh-keyscan -H "$2" >> ~/.ssh/known_hosts

ssh -i 'cert.pem' $3@$4 'echo "ola" > test.remote && pwd'