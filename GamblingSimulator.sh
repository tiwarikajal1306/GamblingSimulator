STACK=100
WIN=1
LOSS=0
totalWin=0
totalLoss=0
numOfDays=20
totalWinOrloss=0
stakePercent=$(( 50*$STACK/100 ))
max_win=$(( $stakePercent+$STACK ))
max_loss=$(( $STACK-$stakePercent ))
for (( day=0; day<$numOfDays; day++ ))
do
	STACK=100
	while [[ $STACK -lt $max_win && $STACK -gt $max_loss ]]
	do
		randomCheck=$((RANDOM%2))
		if [ $randomCheck -eq $WIN ]
        	then
			STACK=$(($STACK+1))
        	else
			STACK=$(($STACK-1))
        	fi
	done
	if [ $STACK -eq $max_loss ]
	then
		((totalLoss++))
		totalWinOrloss=$(( $totalWinOrloss-50 ))
	else
		((totalWin++))
        	totalWinOrloss=$(( $totalWinOrloss+50 ))
	fi
        	echo "Resign for the day"
        done

echo $totalWinOrloss $totalLoss $totalWin
