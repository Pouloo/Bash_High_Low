#!/bin/bash
CONT=1
while [ $CONT -eq 1 ]
do
	clear
	CONT=1
	LIVES=$1
	RANDINT=$(($RANDOM%$2))
	NB=$RANDINT
	TRACE=0
	STREAK=0
	MEDAL=" "

	echo "Wellcome to the HIGH-LOW game human!"

	while [ $LIVES -gt 0 ]
	do
		echo "You have: $LIVES lives left, guess the number..."
		echo "HINT: the number is between 0 and $2"
		#echo "HINT: the number is $RANDINT"
		echo $MEDAL
		read NB
		clear
		if [ $NB -eq $RANDINT -a $TRACE -eq 0 ]
		then
			break
		elif [ $NB -eq $RANDINT ]
		then
			echo -e "Good job, you got it right!\nYou recieve an additional life.\n"
			LIVES=`expr $LIVES + 1`
			STREAK=`expr $STREAK + 1`
			RANDINT=$(($RANDOM%$2+1))
		elif [ $NB -gt $RANDINT ]
		then
			echo -e "Oh no, you are above the number!\nYou lose a life.\n"
			LIVES=`expr $LIVES - 1`
			TRACE=1
			STREAK=0
			MEDAL=" "
		elif [ $NB -lt $RANDINT ]
		then
			echo -e "Oh no, you are under the number!\nYou lose a life.\n"
			LIVES=`expr $LIVES - 1`
			TRACE=1
			STREAK=0 
			MEDAL=" "
		else 
			echo -e "Sorry, your input is not valid.\n"
		fi

		if [ $LIVES -eq 1 ]
		then
			echo -e "Last chance!"
		fi

		if [ $STREAK -eq 3 ]
		then
			echo -e "You got it right 3 times in a row.\nYou're on a streak!\n"
			MEDAL="Streak: x"
		elif [ $STREAK -eq 6 ]
		then
			echo -e "You got it right 6 times in a row.\nYou're a magician!\n"
			MEDAL="Streak: xx"
		elif [ $STREAK -eq 9 ]
		then
			echo -e "You got it right 9 times in a row.\nYou've got a sixth sense!\n"
			MEDAL="Streak: xxx"
		elif [ $STREAK -eq 15 ]
		then
			echo -e "You got it right 15 times in a row.\nYou're omniscient!\n"
			MEDAL="Streak: xxxx"
		fi
	done
	if [ $NB -eq $RANDINT -a $TRACE -eq 0 ]
	then
		clear
		echo -e "Congratulations! You succeeded at your first try, \nluck must be on your side.\n"
	else
		clear
		echo -e "Too bad, you're out of lives! GAME OVER\n"
	fi
	echo "Retry?" 
	echo "1: Continue" 
	echo "0: End" 
	read CONT
done
clear
