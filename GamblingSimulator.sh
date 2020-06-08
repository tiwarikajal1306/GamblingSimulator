#!/bin/bash -x
STACK=100
WIN=1
LOSS=0
randomCheck=$(( RANDOM%2 ))
	if [ $randomCheck -eq $WIN ]
        then
                echo "Bet is win"
		STACK=$(($STACK+1))
        else
		echo "Bet is loss"
		STACK=$(($STACK-1))
        fi
echo "STACK containing $STACK"
