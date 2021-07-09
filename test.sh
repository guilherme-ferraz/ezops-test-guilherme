#!/bin/bash

result=$(grep -Po '"success":false' test.log)
echo $result
if [ -z "$result" ]; then 
    echo "OK"
    echo "OK" > result.log
    cat result.log
    exit 1
else
    echo "FAIL"
    echo "FAIL" > result.log
    cat result.log
    exit 0
fi 