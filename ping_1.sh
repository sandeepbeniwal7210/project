cat host.txt | while read output
do
	ping -c1 -t1 "$ouput" > /dev/null 2>&1
	if [ $? -eq 0 ]
	then
		echo "$output is up"
	else
		echo "$output is down"
	fi
done
