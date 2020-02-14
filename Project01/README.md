# CS 1XA3 Project01 - KASHIS2

## Usage
Execute this script with no arguments taken from project root with:
`chmod +x CS1XA3/Project01/project_analyze.sh`
`cd CS1XA3/Project01`
`./project_analyze.sh`

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
- **Description**: this feature prompts the user for a file extension and then returns the number of files in the CS1XA3 repo that contain that extension. 
- **Pitfalls**: if the user inputs a file extension containing '/', a warning message is thrown because a file can never have that character as an extension but the code still executes without 'errors'.
- **Execution**: execute this feature by providing the number 1 when prompted to pick a number between 1 and 3. (after providing name at the beginning)

## Feature 2: Find Tag
- **Description**: this feature prompts the user for a tag and searches the CS1XA3 repo for any files ending in '.py'. It then analyzes the text inside each .py file and finds all comments (i.e #) with the tag mentioned in them. These comments are then placed in a file called Tag.log (where Tag is the tag inputted by the user) in the Project01 directory.
- **Pitfalls**: none
- **Execution**: execute this feature by providing the number 2 when prompted to pick a number between 1 and 3. (after providing name at the beginning)
- **References**: 
    - https://linuxize.com/post/how-to-check-if-string-contains-substring-in-bash/
    - https://ss64.com/bash/grep.html 

## Feature 3: FIXME Log
- **Description**: this feature searches the repo CS1XA3 for any files where the last line contains the string ***#FIXME*** and prints the file names in a file called fixme.log in the Project01 directory.
- **Pitfalls**: None
- **Execution**: execute this feature by providing the number 3 when prompted to pick a number between 1 and 3 (after providing name at the beginning).
- **Reference**: https://linuxize.com/post/how-to-check-if-string-contains-substring-in-bash/

## Custom Feature 1: Remove/Add File Extension
- **Description**:
    - using the read command, user is prompted to `Remove` or `Add`
    - if the user chooses `Remove`:
        - prompt the user for a file extension but place restriction so .sh and .md extensions can not be inputted
        - find all files that contain that extension and remove it (i.e file1.txt turns into file1 if .txt is extension)
    - if the user chooses `Add`:
        - prompt the user for a directory name and a file extension but place restriction so .sh and .md extensions can not be inputted 
        - the directory, if it doesn't exist (overwrite it if it does) is created
        - files in the repo that do not yet have an extension (i.e do not contain '.' character) are given the extension inputted by the user and moved into the directory that was just created
