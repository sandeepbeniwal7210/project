#read N
if [ $N -gt 10 ]
then
	echo $NUMBER  is greater
elif [ $N -lt 10 ]
then
	echo $NUMBER is lower
elif [ $N -eq 10 ] 
then
	echo $NUMBER is equal 
else
	echo wrong option
fi
