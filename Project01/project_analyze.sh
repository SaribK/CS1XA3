#!/bin/bash

echo "Welcome to my first Bash Script, provide a name:"
#ask user for an input 'name'
read name

echo "Hello $name, select one of the following features by inputting a number"
echo -e '\n 1 - File Type Count \n 2 - Find Tag \n 3 - FIXME Log \n 4 - Backup and Delete/Restore \n 5 - Switch to Executable \n 6 - Remove/Add File Extension \n 7 - To Do List Manager'
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
	elif [ "$varnum" -eq 4 ] ; then
		#6.8 Backup and Delete/Restore
		echo Select one of the following options by inputting a number
		echo -e '\n 1 - Backup your files \n 2 - Restore Files'
		read choice
		#check if they inputted a number
		if ! [[ "$choice" =~ $varchecknum ]] ; then
        		echo "That is not what an integer looks like"
		else
			if [ "$choice" -eq 1 ] ; then
				if [ -d backup ] ; then
					rm -r backup
				fi
				mkdir backup
				touch backup/restore.log
				cd ..
				#store filepaths for all .tmp files into restore.log
				location=`find . -name "*.tmp"`
				echo "$location" > Project01/backup/restore.log
				#put the files in backup and delete original files
				find . -name "*.tmp" | xargs -i cp '{}' Project01/backup
				cat Project01/backup/restore.log | xargs -i rm '{}'
				echo Files backed up
			elif [ "$choice" -eq 2 ] ; then
				cd ..
				#check if restore.log even exists
				if ! [ -e Project01/backup/restore.log ] ; then
					echo There are no files to restore
				else
					#for loop through every filepath in restore.log
					for filepath in `cat Project01/backup/restore.log`; do
						#extract filename using basename
						filename=`basename "$filepath"`
						#find the actual file in backup directore and mv it to its original location
						file=`find Project01/backup -type f -name "$filename"`
						mv "$file" "$filepath"
					done
					#delete restore.log because now the files have been restored
					rm Project01/backup/restore.log
					echo Files Restored
				fi
			else
				echo Invalid entry, ending script
			fi
		fi
	elif [ "$varnum" -eq 5 ] ; then
		#6.7 Switch to Executable
		cd ..
		echo -e '\nSelect one of the following options: \n      1 - Change \n      2 - Restore'
		read choice
		if ! [[ "$choice" =~ $varchecknum ]] ; then
		        echo "That is not what an integer looks like"
		else
		        #if they choose Change
		        if [[ "$choice" -eq 1 ]]; then
				if [ -e Project01/permissions.log ] ; then
					rm Project01/permissions.log
				fi
				touch Project01/permissions.log
				#find all .sh files and loop through each one
		                for file in `find . -type f -name "*.sh"`; do
					#extract the numerical form of the permissions -> Code sourced in README
		                        permission=`stat -c "%a" "$file"`
					#get the first number and check if it has a write permission without execute, or
						#if it has execute without write and react accordingly
		                        num=`echo "$permission" | cut -c 1`
		                        if [[ $num -eq 6 || $num -eq 2 ]]; then
		                                chmod u+x "$file"
		                        fi
		                        if [[ $num -eq 1 || $num -eq 5 ]]; then
		                                chmod u-x "$file"
		                        fi
					#do the same for all 3 numbers
		                        num=`echo "$permission" | cut -c 2`
		                        if [[ $num -eq 6 || $num -eq 2 ]]; then
		                                chmod g+x "$file"
		                        fi
		                        if [[ $num -eq 1 || $num -eq 5 ]]; then
		                                chmod g-x "$file"
		                        fi
		                        num=`echo "$permission" | cut -c 3`
		                        if [[ $num -eq 6 || $num -eq 2 ]]; then
		                                chmod o+x "$file"
		                        fi
		                        if [[ $num -eq 1 || $num -eq 5 ]]; then
		                                chmod o-x "$file"
		                        fi
					#store in permissions.log
		                        echo "$permission:$file" >> Project01/permissions.log
		                done
		        elif [[ "$choice" -eq 2 ]]; then
				if [ -e Project01/permissions.log ] ; then
					#for loop through each file and its permissions
			                for string in `cat Project01/permissions.log`; do
						#extract substrings of permission and the filepath
			                        original=`echo "$string" | cut -d ":" -f1`
			                        file=`echo "$string" | cut -d ":" -f2`
						if [ -e "$file" ] ; then
							#change permission of filepath
			                        	chmod "$original" "$file"
						fi
			                done
				else
					echo There is nothing to restore
				fi
		        else
		                echo Incorrect Input
		        fi
		fi
	elif [ "$varnum" -eq 6 ] ; then
		#Remove/Add File Extension
		cd ..
		echo 'Select one of the following numbers'
		echo -e '\n 1 - Remove file extension \n 2 -  Add file extension'
		read choiceExt
		if ! [[ "$choiceExt" =~ $varchecknum ]] ; then
		        echo "That is not what an integer looks like"
		else
		        if [ "$choiceExt" -eq 1 ] ; then
		                echo 'Which file extension should we search for'
		                read ext
		                #only run code if file extension is not .sh or .md
		                if [ "$ext" = .sh ] || [ "$ext" = .md ] ; then
		                        echo 'Can not search for .sh or .md'
		                else
		                        #find files with that extension and rename the old file
		                        find . -type f -name "*$ext" -print0 | xargs -0 grep -v .git | xargs -0 rename "s/$ext$//"
		                fi
		        elif [ "$choiceExt" -eq 2 ] ; then
		                if [ -d Project01/extensions ] ; then
		                        rm -r Project01/extensions
		                fi
		                echo 'Which file extension should we add'
		                read ext
		                mkdir Project01/extensions
		                if [ "$ext" = .sh ] || [ "$ext" = .md ] ; then
		                        echo 'Can not search for .sh or .md'
		                else
					#find all files without an extension
		                        find . -type f ! -name "*.*" | grep -v .git | xargs -i mv '{}' Project01/extensions
		                        cd Project01/extensions
					#add the extension to the end of each of these files
		                        ls -I '*.*' | xargs -i mv '{}' '{}'"$ext"
		                fi
			else
				echo Invalid Input, Ending Script
		        fi
		fi
	elif [ "$varnum" -eq 7 ] ; then
		#Todo List Manager
		cd ..
		#Find all files without .md or .sh extension and have #TODO comment
		vartodo=`find . -type f ! -name "*.md" ! -name "*.sh" | xargs grep -m1 ^"#TODO"`
		if [ -z "$vartodo" ] ; then
			echo You have nothing TODO
		else
			echo 'Here is your TODO List:'
			echo "$vartodo"
			echo -e '\nSelect one of the following options: \n      1 - Add \n      2 - Delete \n      3 - Replace'
			read num
			if ! [[ "$num" =~ $varchecknum ]] ; then
			        echo "That is not what an integer looks like"
			else
			        if [ "$num" -eq 1 ] ; then
			                #Add
			                echo 'Input the file path you want to make changes to'
			                read filepath
			                #if the file they gave exists
			                if [ -e "$filepath" ] ; then
			                        echo 'Now give a new TODO comment'
			                        read comment
			                        #check if the input starts with #TODO
			                        if [[ "$comment" == "#TODO"* ]] ; then
			                                #add input to the last line
			                                echo "$comment" >> "$filepath"
			                        else
			                                echo "Thats not a TODO Comment"
			                        fi
			                else
			                        echo This file doesnt exist
			                fi
			        elif [ "$num" -eq 2 ] ; then
			                echo 'Input the file path you want to make changes to'
			                read filepath
			                if [ -e "$filepath" ] ; then
			                        #find the old #TODO comment using grep and remove comment using sed
			                        grep -m1 ^"#TODO" "$filepath" | xargs -i sed -i 's/{}//g' "$filepath"
			                else
			                        echo This file does not exist
			                fi
			        elif [ "$num" -eq 3 ] ; then
			                echo 'Input the file path you want to make changes to'
			                read filepath
			                if [ -e "$filepath" ] ; then
			                        echo 'Now give a new TODO comment'
			                        read comment
			                        if [[ "$comment" == "#TODO"* ]] ; then
			                                #add input to the last line
			                                grep -m1 ^"#TODO" "$filepath" | xargs -i sed -i "s/{}/$comment/g" "$filepath"
			                        else
			                                echo "Thats not a TODO Comment"
			                        fi
			                else
			                        echo This file does not exist
			                fi
			        else
			                echo Incorrect Input
			        fi
		fi
			fi
	else
		echo "Invalid entry, ending script"
	fi
fi
