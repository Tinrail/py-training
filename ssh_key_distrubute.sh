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

port=${port:="22"}

read  -p "pls input ssh public key (defult /root/.ssh/id_rsa.pub enter):" file

file=${file:="/root/.ssh/id_rsa.pub"}
 
if [ ! -f $file ]
then
	echo "ssh public key file not exist!"
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
	
	/usr/bin/ssh-copy-id -p ${port} -i /root/.ssh/id_rsa.pub root@${ip}  > /dev/null

else
	echo
	echo -e "\033[31m ssh-copy-id command is not exites ! \033[0m"
	exit
fi
	
result=$(ssh -p ${port} root@${ip} "echo $?")

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

read -p "Do you want to continue ?" cont

if [ "$cont" ==  "y" -o "$cont" == "Y" ]
then 
	continue
else
	echo -e "\033[32m bye ! \033[0m"
	exit 0
fi

done       
