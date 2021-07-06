#!/bin/bash

echo "deployment at $(date)" >> deployments.log

for ARGUMENT in "$@"; do
    KEY=$(echo $ARGUMENT | cut -f1 -d=)
    VALUE=$(echo $ARGUMENT | cut -f2 -d=)   

    case "$KEY" in
        path)  path=$VALUE ;;
        *)
    esac
done

if [ -d "$path" ]; then 
    cd $path
    npm install
else 
    exit 1
fi

sudo supervisorctl reread
sudo supervisorctl update ezops 