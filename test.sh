#!/bin/bash 
if curl -s --head  --request GET "localhost" | grep "200 OK" > /dev/null; then
   echo "$site is UP"
else
   exit 0
fi
