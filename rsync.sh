#!/bin/bash

read  -p "please input file name with remote host name :" host

if [ ! -f $host ]
then
	echo "The ${host} is not exist!"
fi

read  -p "pls input want transter to remote host file :" file

if [ ! -f $host ]
then
	echo "The ${file} is not exist!"
fi

IFS=$'\n'

for server in $(cat "$host")
do
     host=$(echo $server | awk '{print $1}')
     /usr/bin/rsync  "${file}" root@$host:/root/
     if [ $? == "0" ]
     then
     	echo "transter file to ${host} completed"
     fi
done
