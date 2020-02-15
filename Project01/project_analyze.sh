#!/bin/bash

echo "Welcome to my first Bash Script, provide a name:"
#ask user for an input 'name'
read name

echo "Hello $name, pick a number between 1 and 3":
#prompt for a number
read varnum

varchecknum='^[0-9]+$'
#check if input is a number
if ! [[ "$varnum" =~ $varchecknum ]] ; then
	echo "That is not what an integer looks like"
else
	if [ "$varnum" -eq 1 ] ; then
		#6.5 File Type Count
		cd ..
		echo Provide a valid File Extension like .txt or .py:
		read extension
		#recursively search from current directory for any files with the given extension
		varcount=`find . -type f -name "*$extension" | wc -l`
		echo "There are $varcount $extension files"
	elif [ "$varnum" -eq 2 ] ; then
		#6.6 Find Tag
		cd ..
		echo Please provide any single word:
		read tag
		#check if the tag contains a slash (code does not run when / is inputted)
		if ! [[ "$tag" =~ "/" ]] ; then
			#if file exists, overwrite it
			if [ -e Project01/"$tag.log" ] ; then
				rm Project01/"$tag.log"
			fi
			touch Project01/"$tag.log"
			#recursively search all files ending in .py
			#use grep to read each file to find all lines containing # and the tag in the same line
			vartags=`find . -name "*.py" | xargs grep -h "#*" | grep -h "$tag"`
			#write all those lines into the file we just created
			echo "$vartags" > Project01/"$tag.log"
			echo "Find the tag $tag executed"
		else
			#tell user that they gave wrong input
			echo "You can not have a /, exiting code"
		fi
	elif [ "$varnum" -eq 3 ] ; then
		#6.2 FIXME Log
		cd ..
		if [ -e Project01/fixme.log ] ; then rm Project01/fixme.log
		fi
		touch Project01/"fixme.log"
		#get every file that contains #FIXME
		for fixmeFile in `grep -rl "#FIXME"` ; do
			#get last line of each file
			end=`tail -1 "$fixmeFile"`
			#check if the line has #FIXME and put file name in fixme.log
			if [[ "$end" =~ "#FIXME" ]] ; then echo "$fixmeFile" >> Project01/"fixme.log"
			fi
		done
		echo Done
	else
		echo "Invalid entry, ending script"
	fi
fi
