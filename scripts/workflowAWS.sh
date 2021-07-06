#!/bin/bash

# # sudo apt-get update
# # sudo apt-get install -y curl 

# # curl ifconfig.me 

# #defaults
# action='firstDeploy'

# for ARGUMENT in "$@"; do
#     KEY=$(echo $ARGUMENT | cut -f1 -d=)
#     VALUE=$(echo $ARGUMENT | cut -f2 -d=)   

#     case "$KEY" in
#         cert)    cert=$VALUE ;;
#         user)    user=$VALUE ;;
#         host)    host=$VALUE ;;
#         action)  action=$VALUE ;;
#         *)
#     esac    
# done

# #config cert and ssh connection
# echo "$cert" > cert.pem && chmod 400 cert.pem
# mkdir -p ~/.ssh/ && chmod 700 ~/.ssh/
# ssh-keyscan -H "$host" >> ~/.ssh/known_hosts

# ssh -i 'cert.pem' $user@$host 'if [ -d "/home/ubuntu/ezops-test-guilherme/" ];then \
# cd /home/ubuntu/ezops-test-guilherme/ && \
# git pull && \
# cd scripts && \
# rollingUpdate.sh; else; cd /home/ubuntu/ && \
# git clone git@github.com:guilherme-ferraz/ezops-test-guilherme.git && \
# cd ezops-test-guilherme/scripts/ && \
# firstDeploy.sh; fi'

echo "$(cat /home/guilherme/AWS/ssh-keys/guilherme-note-dev.pem)" > cert.pem && \
chmod 400 cert.pem && \
mkdir -p ~/.ssh/ && \
chmod 700 ~/.ssh/ && \
ssh -i 'cert.pem' ubuntu@$host \
"if [ -d "$fullPath" ]; then
cd $fullPath && \
git pull && \
chmod +x $scriptPath/rollingUpdate.sh && \
$scriptPath/rollingUpdate.sh;
else 
cd $parentPath && \
git clone $gitProject && \
cd $scriptPath && \
firstDeploy.sh; fi"