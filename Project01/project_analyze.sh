#!/bin/bash

echo "Welcome to my first Bash Script, provide a name:"

read name

echo "Hello $name, pick a number between 1 and 3":

read varnum

varchecknum='^[0-9]+$'

if ! [[ "$varnum" =~ $varchecknum ]] ; then
	echo "That is not what an integer looks like"
else
	if [ "$varnum" -eq 1 ] ; then
		#6.5 File Type Count
		cd ..
		echo Provide a valid File Extension like .txt or .py:
		read extension
		varcount=`find . -type f -name "*$extension" | wc -l`
		echo "There are $varcount $extension files"
	elif [ "$varnum" -eq 2 ] ; then
		#6.6 Find Tag
		cd ..
		echo Please provide any single word:
		read tag
		if ! [[ "$tag" =~ "/" ]] ; then
			if [ -e Project01/"$tag.log" ] ; then
				rm Project01/"$tag.log"
			fi
			touch Project01/"$tag.log"
			vartags=`find . -name "*.py" | xargs grep -h "#*$tag"`
			echo "$vartags" > Project01/"$tag.log"
			echo "Find the tag $tag executed"
		else
			echo "You can not have a /, exiting code"
		fi
	elif [ "$varnum" -eq 3 ] ; then
		#6.2 FIXME Log
		cd ..
		if [ -e Project01/fixme.log ] ; then
			rm Project01/fixme.log
		fi
		touch Project01/fixme.log
		for fixmeFile in `grep -rl "#FIXME"` ; do
			lastline=`tail -1 "$fixmeFile"`
			if [[ "$lastline" =~ "#FIXME" ]] ; then
				echo "$fixmeFile" >> Project01/"fixme.log"
			fi
		done
		echo Done
	else
		echo "Invalid entry, ending script"
	fi
fi
