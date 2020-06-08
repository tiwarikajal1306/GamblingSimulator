#!/bin/bash -x
STACK=100
WIN=1
LOSS=0
numOfDays=20
totalWinOrloss=100
stakePercent=$(( 50*$STACK/100 ))
max_win=$(( $stakePercent+$STACK ))
max_loss=$(( $STACK-$stakePercent ))
for (( day=0; day<$numOfDays; day++ ))
do
	while [ $STACK -lt $max_win ] && [ $STACK -gt $max_loss ]
	do
		randomCheck=$(( RANDOM%2 ))
		if [ $randomCheck -eq $WIN ]
        	then
                	echo "Bet is win"
			STACK=$(($STACK+1))
        	else
			echo "Bet is loss"
			STACK=$(($STACK-1))
        	fi
	done

	if [ $STACK -eq $max_loss ]
	then
		totalWinOrloss=$(( $totalWinOrloss-50 ))
	else
        	totalWinOrloss=$(( $totalWinOrloss+50 ))
	fi
        	echo "Resign for the day"
        done

echo $totalWinOrloss
