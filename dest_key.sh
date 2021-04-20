#!/bin/bash
# **********************************************************
# * Author : Alexandra
# * Email : 18306730@qq.com
# * Create time : 2020-11-17 08:54
# * Filename : dist_key.sh
# * Description :
# **********************************************************
read  -p "pls input servers file :" file

IFS=$'\t'

for server in $(cat $file)
do
	ip=$(cat server | awk '{print $1}')
	passwd=$(cat server | awk '{print $2}')
	
    if [ -f /usr/bin/ssh-copy-id -a -x /usr/bin/ssh-copy-id ]
      then
		 /usr/bin/ssh-copy-id -p ${port} -i ${file} root@${ip}  > /dev/null
	     result=$(echo $?)
    else
	  echo
	  echo -e "\033[31m Error! ssh-copy-id command is not exites  \033[0m"
	  exit
    fi
	
done