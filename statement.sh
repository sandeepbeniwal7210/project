#read N
if [ $NUMBER -gt 20 ]
then
	echo $NUMBER  is greater
elif [ $NUMBER -lt 20 ]
then
	echo $NUMBER is lower
elif [ $NUMBER -eq 20 ] 
then
	echo $NUMBER is equal 
else
	echo wrong option
fi
