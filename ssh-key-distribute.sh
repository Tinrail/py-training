#!/bin/bash
# **********************************************************
# * Author : Alexandra
# * Email : 18306730@qq.com
# * Create time : 2020-11-17 08:54
# * Filename : ssh_key_distrubute.sh
# * Description :
# **********************************************************

read -t 10 -p "pls input one ip address :" ip

if [ -z $ip ];then
        echo "ip address is null!"
        exit 1
fi

read -t 10 -p "pls input port number (defult 22 enter) :" port
port=${port:="22"}


read -t 10 -p "pls input ssh public key (defult /root/.ssh/id_rsa.pub enter):" file

file=${file:="/root/.ssh/id_rsa.pub"}

if [ ! -f $file ];then
        echo "ssh public key file not exist!"
        exit 1

fi

local_ip=$(ifconfig |grep inet |grep -v inet6 |grep -v "inet 127" |awk '{print $2}')

remote_file="${file##*/}-${local_ip}"

scp -P ${port} ${file} root@${ip}:/root/${remote_file}

#file=${file##*/}

ssh -p ${port} root@${ip} cat "/root/${remote_file} >> /root/.ssh/authorized_keys"

result=$(ssh -p ${port} root@${ip} "echo $?")

if [ $result -ne "0" ];then
        echo ":) succeed,good job! "
else
        echo ":( failure!"
if