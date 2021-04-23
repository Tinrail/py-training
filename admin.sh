#!/bin/bash

function key(){
	
	if [ $(whereis expect |wc -l) == "0" ];then 
    	 echo "\033[31m you need install Expect tools. \033[0m"
     	 exit
	fi

	read  -p "$(echo -e "\033[1;34mplease input  file  name with remote host name and password :\033[0m")" hosts

	if [ ! -f $hosts ]
	then
    	    echo -e "\033[31m Error! file ${file} not exist. \033[0m"
    	    exit 1
	fi

	if [ $(cat $hosts |wc -l) == "0" ]
	then
		echo -e "\033[31m Error! ${host} in empty. \033[0m"
        exit
    fi

	IFS=$'\n'

	for server in $(cat "$hosts")
	do
	
    	host=$(echo $server | awk '{print $1}')
		passwd=$(echo $server | awk '{print $2}')
    	/usr/local/bin/expect ssh-copy-id.exp $host $passwd > /dev/null 
    	if [ $? == '0' ];then
		   echo "mission ssh-copy-id for host ${host} complete"
    	else
    	   echo -e "\033[31m mission ssh-copy-id for host ${host} failed \033[0m"
    	fi
        
	done

}

function tran(){
	
	read  -p "$(echo -e "\033[1;34mplease input file name with remote host name :\033[0m")" host

	if [ ! -f $host ]
	then
		echo "The ${host} is not exist!"
		exit
	fi

	if [ $(cat $host |wc -l) == "0" ]
	then
		echo -e "\033[31m Error! ${host} in empty. \033[0m"
        exit
    fi

	read  -p "$(echo -e "\033[1;34mplease input want transter to remote host file :\033[0m")" file

	if [ ! -f $file ]
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
	     else
	     	echo -e "\033[31m transter to ${host} field. \033[0m"
	     fi
	done
}

function exe(){
	
	read  -p "$(echo -e "\033[1;34mplease input file name with remote host name :\033[0m")" host

	if [ ! -f $host ]
	then
		echo "The ${host} is not exist!"
	    exit
	fi

	if [ $(cat $host |wc -l) == "0" ]
	then
		echo -e "\033[31m Error! ${host} in empty. \033[0m"
        exit
    fi

	read  -p "$(echo -e "\033[1;34mplease input file that execute command to remote host :\033[0m")" file

	if [ ! -f $file ]
	then
		echo "The ${file} is not exist!"
	    exit
	fi

	IFS=$'\n'

	for server in $(cat "$host")
	do
	     host=$(echo $server | awk '{print $1}')

	     ssh -t -t root@$host < $file > /dev/null 
         
	     if [ $? == "0" ]
	     then
	     	echo "send command  to ${host} completed."
	     else
	     	echo -e "\033[31m send command  to ${host} field. \033[0m"

	     fi
	done
}

function menu(){

clear

echo -e '\033[32m
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                M A I N - M E N U
====================================================
	1.Install public key to remote servers
	2.Send file to remote servers
	3.Execute commands in remote servers
	4.Exit
====================================================

\033[0m '
}

function chose(){

	read  -p "$(echo -e "\033[1;34mPlease enter your chose [ 1 - 4 ] :\033[0m")" command

	case "$command" in
		1)
	        key
	        ;;
		2)
	        tran
	        ;;
		3)
			exe
			;;
		4)
			echo "bye!"
			exit
			;;
		*)  
            echo ""
	        echo -e "\033[31m ERROR! must is {1|2|3|4} \033[0m"
	        echo ""
	esac
}


function main (){
	while true
	do
		menu
		chose
	done
}

main