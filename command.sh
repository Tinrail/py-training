#!/bin/bash
read  -p "please input file name with remote host name :" host

if [ ! -f $host ]
then
	echo "The ${host} is not exist!"
     exit
fi

read  -p "pls input file that execute command to remote host :" file

if [ ! -f $file ]
then
	echo "The ${file} is not exist!"
     exit
fi

IFS=$'\n'

for server in $(cat "$host")
do
     host=$(echo $server | awk '{print $1}')

     ssh -t -t root@$host < $file >/dev/null 
     
     
     if [ $? == "0" ]
     then
     	echo "send command  to ${host} completed."
     else
     	echo -e "\033[31m send command  to ${host} field. \033[0m"

     fi
done
