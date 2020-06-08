STACK=100
WIN=1
LOSS=0
totalWin=0
totalLoss=0
numOfDays=30
totalWinOrloss=0

declare -A winningDays
declare -A loosingDays

stakePercent=$(( 50*$STACK/100 ))
max_win=$(( $stakePercent+$STACK ))
max_loss=$(( $STACK-$stakePercent ))
for (( day=1; day<=$numOfDays; day++ ))
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
		loosingDays["Day"$day]=$totalWinOrloss

	else
		((totalWin++))
        	totalWinOrloss=$(( $totalWinOrloss+50 ))
		winningDays["Day"$day]=$totalWinOrloss
	fi
        done
echo "winningDays: ${!winningDays[@]}"
echo "lossingDays: ${!loosingDays[@]}"
echo "net winning= $totalWinOrloss number Of Loss Days= $totalLoss number of win Days= $totalWin"
