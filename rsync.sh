read  -p "pls input servers file :" file

for server in $(cat "$file")
do
     host=$(echo $server | awk '{print $1}')
     /usr/bin/rsync  "${file}" root@$host:/root/
done
