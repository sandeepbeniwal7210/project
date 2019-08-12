if [ $OPERATION == "Addition" ]
then
	echo "INFO :: Addition"
	echo $((FISRT_NUMBER+SECOND_NUMBER))
elif [ $OPERATION == "Subtraction" ]
then
	echo "INFO :: Subtraction"
	echo $((FIRST_NUMBER-SECOND_NUMBER))
	[ $FIRST_NUMBER -lt $SECOND_NUMBER ] && echo "WARN :: Subtrahend greater than minuend : Difference is negative"
elif [ $OPERATION == "Multiplication" ]
then
	echo "INFO :: Multiplication"
	echo $((FISRT_NUMBER*SECOND_NUMBER))
elif [ $OPERATION == "Division" ]
then
	echo "INFO :: Division"
	[ $SECOND_NUMBER -eq 0 ] && echo "ERROR :: Divisor is 0 : Exiting" && exit 1
	echo Remainder is $((FIRST_NUMBER%SECOND_NUMBER))
	echo Quotient is $((FISRT_NUMBER/SECOND_NUMBER))
else
	echo "ERROR :: Wrong option selecter : Exiting" exit 1
fi
