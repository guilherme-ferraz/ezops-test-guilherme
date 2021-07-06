#!/bin/bash

echo "${{ secrets.AWS_SSH_PEM }}" > cert.pem
chmod 400 cert.pem
mkdir -p ~/.ssh/
chmod 700 ~/.ssh/
ssh-keyscan -H "${{ secrets.AWS_KNOWN_HOSTS }}" >> ~/.ssh/known_hosts

ssh -i 'cert.pem' ${{ secrets.AWS_USER }}@${{ secrets.AWS_HOST }} 'echo "ola" > test.remote && pwd'