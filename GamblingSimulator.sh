#!/bin/bash -x
STACK=100
WIN=1
LOSS=0
totalWin=0
totalLoss=0
numOfDays=30
totalWinOrloss=0
maximumWinAmount=0
maximumLooseAmount=1500
daysPlayed=0
declare -A winningDays
declare -A loosingDays

userInput=1
while ((userInput == 1))
do

	stakePercent=$(( 50*$STACK/100 ))
	max_win=$(( $stakePercent+$STACK ))
	max_loss=$(( $STACK-$stakePercent ))
	for (( day=1+daysPlayed; day<=(numOfDays+daysPlayed); day++ ))
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
			if [ $maximumLooseAmount -gt $totalWinOrloss ]
			then
				maximumLooseAmount=$totalWinOrloss
			fi
		else
			((totalWin++))
	        	totalWinOrloss=$(( $totalWinOrloss+50 ))
			winningDays["Day"$day]=$totalWinOrloss
			if [ $maximumWinAmount -lt $totalWinOrloss ]
			then
				maximumWinAmount=$totalWinOrloss
			fi
		fi
	        done
	echo "winningDays: ${!winningDays[@]}"
	echo "lossingDays: ${!loosingDays[@]}"
	echo "Luckiest Days:"
	for keys in ${!winningDays[@]}
	do
		if [ ${winningDays[$keys]} -eq $maximumWinAmount ]
		then
			echo $keys
		fi
	done
	echo "Unluckiest Days:"
	for keys in ${!loosingDays[@]}
	do
		if [ ${loosingDays[$keys]} -eq $maximumLooseAmount ]
		then
			echo $keys
		fi
	done
	echo "net winning= $totalWinOrloss number Of Loss Days= $totalLoss number of win Days= $totalWin"
	if [ $totalWinOrloss -gt 0 ]
	then
		daysPlayed=$((daysPlayed+numOfDays))
		read -p "Enter 1 if you want to play again" userInput
	else
		userInput=13
	fi
done
