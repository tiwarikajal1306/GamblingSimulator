#!/bin/bash -x
STACK=100
WIN=1
LOSS=0

stakePercent=$(( 50*$STACK/100 ))
max_win=$(( $stakePercent+$STACK ))
max_loss=$(( $STACK-$stakePercent ))

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

echo "STACK containing $STACK"
echo "Resign for the day"
