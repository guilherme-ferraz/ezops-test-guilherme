#!/bin/bash

echo "deployment at $(date)" >> deployments.log

for ARGUMENT in "$@"; do
    KEY=$(echo $ARGUMENT | cut -f1 -d=)
    VALUE=$(echo $ARGUMENT | cut -f2 -d=)   

    case "$KEY" in
        path)     path=$VALUE ;;
        env)      env=$VALUE ;;
        *)
    esac
done

if [ -d "$path" ]; then 
    cd $path
    npm install
else 
    exit 1
fi

cp $env $path.env

sudo supervisorctl reread
sudo supervisorctl update ezops 
sudo supervisorctl restart ezops 