#read N
if [ $NUMBER -gt 10 ]
then
	echo $NUMBER  is greater
elif [ $NUMBER -lt 10 ]
then
	echo $NUMBER is lower
elif [ $NUMBER -eq 10 ] 
then
	echo $NUMBER is equal 
else
	echo wrong option
fi
