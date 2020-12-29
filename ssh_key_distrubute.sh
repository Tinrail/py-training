#!/bin/bash
# **********************************************************
# * Author : Alexandra
# * Email : 18306730@qq.com
# * Create time : 2020-11-17 08:54
# * Filename : ssh_key_distrubute.sh
# * Description :
# **********************************************************
input () {
read  -p "pls input one ip address :" ip

if [ -z $ip ]
then
	echo "ip address is null!"
	exit 1
fi

read  -p "pls input port number (defult 22 enter) :" port

if [ -n "$port" ]
then
	expr $port + 1 &> /dev/null
	t=$(echo $?)
	if [ "$t" -ne 0 ]
	then
		echo 
		echo -e "\033[31m Error! port number is not integer \033[0m"
		echo
		exit 1
	fi 	
fi

port=${port:="22"}

user=$(whoami)

if [ "$UID" == 0 ]
then
	defult_file="/root/.ssh/id_rsa.pub"
else
	defult_file="/home/${user}/.ssh/id_rsa.pub"
fi

read  -p "pls input ssh public key (defult ${defult_file} enter):" file

file=${file:=$defult_file}

if [ ! -f $file ]
then
	echo -e "\033[31m Error! ssh public key file not exist \033[0m"
	exit 1
fi

return
}

while (true)

do

input

#local_ip=$(ifconfig |grep inet |grep -v inet6 |grep -v "inet 127" |awk '{print $2}')

#remote_file="${file##*/}-${local_ip}"

#ssh -p ${port} root@${ip} cat "/root/${remote_file} >> /root/.ssh/authorized_keys"

if [ -f /usr/bin/ssh-copy-id -a -x /usr/bin/ssh-copy-id ]
then
		/usr/bin/ssh-copy-id -p ${port} -i ${file} root@${ip}  > /dev/null
	result=$(echo $?)
else
	echo
	echo -e "\033[31m Error! ssh-copy-id command is not exites  \033[0m"
	exit
fi

if [ "$result" -eq 0 ]
then
	#ssh -p ${port} root@${ip} "rm -f /root/${remote_file}"
	echo
	echo -e "\033[32m :) succeed,good job! \033[0m"
	echo

else
	echo
	echo -e "\033[31m :( failure! \033[0m"
	echo
	exit 1
fi

read -p "Do you want to continue ? [y|Y]" cont

if [ "$cont" ==  "y" -o "$cont" == "Y" ]
then
	continue
else
	echo -e "\033[32m bye ! \033[0m"
	exit 0
fi

done
