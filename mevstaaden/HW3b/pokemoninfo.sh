#!/bin/bash

#######################################################################
#
# MNXB01-2017-HW3b
# File: pokemoninfo.sh.skeleton file
# Author: Florido Paganelli florido.paganelli@hep.lu.se
#         Lund University
#
########################################################################

# The script must take in input as an argument the directory where the 
# database is stored.
# for example:
#   ./pokemoninfo.sh dataset/
# note that the name 'dataset' should not be hardcoded. It can be any directory
# name. Make sure to read slides 33,34,39 
# Store the folder name in a variable called DBDIR.
DBDIR=$1

# use this function to show an error message with usage information.
errormsg() {
   echo "Usage:"
   echo "$0 <directory>"
   echo "directory must be a path containing a csv dataset."	
}

### Exercise 1: 1 points
# Write an error and exit if no command line argument exists or if the argument
# is empty (it could be a variable!)
# hint: use the if construct and the proper conditions to verify the arguments

# YOUR CODE HERE

if [[ $# -le 0 ]]; then 
	echo "Argument does not exist." ;
	#exit with error
	exit 1;
else
	echo "Argument valid." ;
fi

### Exercise 2: 1 points
# Write an error and exit if the DBDIR directory does not exist or it's not a directory.
# Hint: read http://tldp.org/LDP/Bash-Beginners-Guide/html/sect_07_01.html

# YOUR CODE HERE

if [[ -d $DBDIR ]]; then
	echo "Argument is a Directory.";
else 
	echo "Arugment is not a directory or does not exist." ;
	#exit with error
	exit 1;
fi
	
	
### Exercise 3: 1 point
# Use the grep command to find which file contains "Pokémon Red Version"
# and output the results on screen.
# grep examples: http://tldp.org/LDP/Bash-Beginners-Guide/html/sect_04_02.html

echo -e "\nSearching for Pokémon Red..."
# YOUR CODE HERE

pokred=$(grep -nr "Pokémon Red Version" $DBDIR)
echo "The file containing Pokémon Red Version is $pokred" 

### Exercise 4: 1 point
# delete existing allplatform.csv file in preparation of the next exercise
echo -e "\nRemoving old allplatforms.csv"
# YOUR CODE HERE

rm allplatforms.csv

### Exercise 5: 3 points
# Write a for loop that takes every file in the database and puts it 
# into a single file
# called allplatforms.csv.
# Inspect the csv files to understand their structure,
# and make sure to remove the header lines.
# Hint: use the slides about for ... do ... done
#       use the tail command to remove the header lines (check 'man tail'),
#       use the file concatenator '>>' to write out the allplatforms.csv file

# create allplatforms file with a for loop
echo -e "\nCreating new allplatforms.csv"

# YOUR FOR LOOP HERE

for somefile in $DBDIR/*; do
	read=$(tail -n+2 $somefile);
	echo -e "$read" >> allplatforms.csv;
done

### Exercise 4: 1 point
# Sort the contents of the allplatforms.csv file by using the sort 
# command and write the result in allplatforms.ordered.csv
# Hint: use \" as a delimiter for sort. Check 'man sort'
echo -e "\nSorting allplatforms.csv..."
# YOUR CODE HERE

sort -t\" -k3 -o allplatforms.ordered.csv allplatforms.csv


# Exercise 5: 4 points
# Write a for loop that, for each file, counts all the games
# in each file. Inspect the csv file to understand the structure of the 
# csv file to get the right numbers.
# Hint: use the slides about for ... do ... done
#       use the '$()' syntax to put the output of a command inside a variable
#       use the program tail to get rid of useless lines
#       use the program wc to count things
#       make use of the | symbol to compose         
#       use the 'basename' command to get rid of the directory part of the filename
# output the result in this form:
# <filename> has <number of games> games <newline>
# example output:
# poke.Android.csv has 2 game(s)
# poke.iOS.csv has 1 game(s)
echo -e "\nCalculating number of games for each file..."

#YOUR CODE HERE

for afile in $DBDIR/*; do 
	NumofGames=$(tail -n+2 $afile|wc -l);
	filename=$( basename $afile );
	
	echo -e "$filename has $NumofGames game(s) \n" 
done

exit 0;
