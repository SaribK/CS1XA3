# CS 1XA3 Project01 - KASHIS2

## Usage
Execute this script with no arguments taken from project root with:
`chmod +x CS1XA3/Project01/project_analyze.sh`
`cd CS1XA3/Project01`
`./project_analyze.sh`
Note: This script takes no arguments

On execution:
1. Using the read command, the script prompts the user for their name, and greets them.
1. User is asked to pick a number between 1 and 3 (each number represents a feature) with the read command.
1. Script checks if the previous input is an integer.
   - Reference: stackoverflow.com/questions/806906
   - If not, a message is echoed telling the user that the input is invalid,
     and ends the script
   - If it is an integer between 1 and 3, then the script will execute whichever
     feature is associated with the number
   - If it is any other integer, a message is echoed saying the input is invalid,
  and the script ends
- For example, the following inputs will execute Feature 6.6 Find Tag:
  - Welcome to my first Bash Script, provide a name:
    John
  - Hello John, pick a number between 1 and 3:
    2

## Feature 1: File Type Count
- **Description**: this feature prompts the user for a file extension and then returns the number of files in the CS1XA3 repo that contain that extension. Script recursively searches the repo for files with the extension.
- **Pitfalls**: if the user inputs a file extension containing '/', a warning message is thrown because a file can never have that character as an extension but the code still executes without 'errors'.
- **Execution**: execute this feature by providing the number 1 when prompted to pick a number between 1 and 3. (after providing name at the beginning)

## Feature 2: Find Tag
- **Description**: this feature prompts the user for a tag using 'read' and searches the CS1XA3 repo for any files ending in '.py' with the find function. Using piping, each file is passed to two grep functions which check each file for lines starting with '#' and containing the tag. These lines are echoed into the file Tag.log where Tag is the tag provided by the user 
- **Pitfalls**: none
- **Execution**: execute this feature by providing the number 2 when prompted to pick a number between 1 and 3. (after providing name at the beginning)
- **References**: 
    - https://linuxize.com/post/how-to-check-if-string-contains-substring-in-bash/
    - https://ss64.com/bash/grep.html 

## Feature 3: FIXME Log
- **Description**: this feature searches the repo CS1XA3 for any files where the last line contains the string ***#FIXME*** using recursive grep. Then, script checks if the last line contains *#FIXME* and if it does, then script prints the file names in a file called fixme.log in the Project01 directory.
- **Pitfalls**: None
- **Execution**: execute this feature by providing the number 3 when prompted to pick a number between 1 and 3 (after providing name at the beginning).
- **Reference**: https://linuxize.com/post/how-to-check-if-string-contains-substring-in-bash/

## Feature 4: Backup and Delete/Restore
- **Description**: prompts the user to `Backup` or `Restore`. If `Backup` is selected, using the find and cp command, script moves all files ending in .tmp into a backup directory with a file restore.log that has the file paths of the files. If `Restore` is selected, script moves files back to their original location
- **Pitfalls**: If there are two files in different directories with the same name, the script only takes the first file because it can not put two files with the same name in the directory
- **Execution**: execute this feature by inputting 4 when prompted to select a feature
 
## Feature 5: Switch to Executable
- **Description**: prompts the user to `Change` or `Restore`. For `Change`, script changes permissions so that only people with write permissions have executable. Also, it keeps a log of the original permissions. For `Restore`, script puts back the original permissions on each file it changed.
- **Pitfalls**: 
- **Execution**: execute this feature by inputting 5 when prompted to select a feature
- **References**: 
    - https://superuser.com/questions/359989/what-is-a-simple-standard-command-line-way-of-getting-ls-to-produce-file-permi
    - https://stackoverflow.com/questions/10218474/how-to-obtain-the-first-letter-in-a-bash-variable
    - https://stackabuse.com/substrings-in-bash/

## Custom Feature 1: Remove/Add File Extension
- **Description**:
    - using the read command, user is prompted to `Remove` or `Add` file extensions
    - if the user chooses `Remove`:
        - prompt the user for a file extension but place restriction so .sh and .md extensions can not be inputted
        - find all files that contain that extension and remove it (i.e file1.txt turns into file1 if .txt is extension)
    - if the user chooses `Add`:
        - prompt the user for a directory name and a file extension but place restriction so .sh and .md extensions can not be inputted
        - the directory, if it doesn't exist (overwrite it if it does) is created
        - files in the repo that do not yet have an extension (i.e do not contain '.' character) are given the extension inputted by the user and moved into the directory that was just created
- **Pitfalls**: Although it is fixed now, when user chose to add a file extension, the script would also go into the ".git" directory and take files from there, but then I modified the script so that it ignores any files inside the .git repository
- **Execution**: execute this feature by inputting 6 when prompted to select a feature
- **References**: 
    - https://stackoverflow.com/questions/4509485/linux-remove-file-extensions-for-multiple-files
    - https://unix.stackexchange.com/questions/144208/find-files-without-extension

## Custom Feature 2: To do list Manager
- **Description**:
    - Find all files that have '#TODO' inside them and display them to the user. Note: the line must start with a comment. The file path should be first, and then the line containing #TODO should be beside it (if a file has multiple occurences of #TODO, print the first one)
        - Sample display: 
            - Project01/file.py: #TODO add if statement 
            - Sample/test.py: #TODO ask for user input 
    - Prompt the user to either `Add`, `Delete`, or `Replace`
    - If user chooses `Add`:
        - Using the read command, prompt them for the file path that they want to modify as well as the new #TODO comment itself. Add the comment in the last line of that file
    - If user chooses `Delete`:
        - Using the read command, prompt them for the file path that they want to modify. Delete the #TODO comment from the file. 
    - If user chooses `Replace`:
        - Prompt them for the file path of file that they want to modify and new #TODO comment. Replace the old #TODO comment with the new one
- **Execution**: execute this feature by inputting 7 when prompted to select a feature
- **References**: 
    - https://unix.stackexchange.com/questions/57876/how-to-print-only-the-first-match-with-grep
    - https://linuxize.com/post/how-to-use-grep-command-to-search-files-in-linux/
