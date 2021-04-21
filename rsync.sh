#!/bin/bash

read  -p "pls input servers file :" file

if [ ! -f $file ]
then
	echo "The ${file} is not exist!"
fi

for server in $(cat "$file")
do
     host=$(echo $server | awk '{print $1}')
     /usr/bin/rsync  "${file}" root@$host:/root/
     if [ $? == "0" ]
     then
     	echo "transter file to ${host} completed"
     fi
done
