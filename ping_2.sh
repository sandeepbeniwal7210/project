while read hostname
do
	ping -c 1 "$hostname" > /dev/null 2>&1 && echo "Node is $hostname : Success" || echo "Node of $hostname : failed"
done < host.txt
