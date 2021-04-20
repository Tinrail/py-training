#!/bin/bash
# **********************************************************
# * Author : Alexandra
# * Email : 18306730@qq.com
# * Create time : 2021-04-19 08:54
# * Filename : dest_key.sh
# * Description :
# **********************************************************

file="/root/.ssh/id_rsa.pub"

if [ $(rpm -qa expect |wc -l) == "0" ];then 
     echo "\033[31m you need install Expect tools. \033[0m"
     exit
fi

if [ ! -f $file ]
then
        echo -e "\033[31m Error! ssh public key file not exist. \033[0m"
        exit 1
fi



read  -p "pls input servers file :" file

IFS=$'\n'

for server in $(cat "$file")
do
	
        
        host=$(echo $server | awk '{print $1}')
	passwd=$(echo $server | awk '{print $2}')
        /usr/bin/expect ssh-copy-id.exp $host $passwd 
        if [ $? == '0' ];then
	   echo "mission ssh-copy-id for host ${host} complete"
        else
           echo "mission ssh-copy-id for host ${host} failed"
        fi
        
	
done
