#!/bin/bash

#######################################################################
#
# MNXB01-2017-HW3b
# File: pokemon.sh solution file
# Author: Florido Paganelli florido.paganelli@hep.lu.se
#         Lund University
#
########################################################################

# initializes the variable dbdir that contains the directory where the files are.
DBDIR=''

# Exercise 1: 2 points
# The script must take in input the directory where the database is stored.
# Store it in a variable called DBDIR.
# Write an error and exit if no parameter of the directory does not exist.
# hint: use the if construct and the proper conditions to verify parameters
# and directory existence.

# Exercise 2: 1 point
# Use the grep command to find which file contains "Pokemon Red Version"


#Exercise 2: 3 points
# Write a for loop that takes every file and puts it into a single file
# called allplatforms.csv. Make sure to remove the header lines.
# Hint: use the tail command to remove the header lines,
# the pipe | symbol to pass results from one program to the other, 
# the redirector > to write out the file

#Exercise 4: 1 point
# Sort the contents of the allplatform.csv file by using the sort 
# command and write the result in allplatforms.ordered.csv
# Hint: use \" as a delimiter for sort.


# Exercise 2: 4 points
# Write a for loop that, for each file, counts all the games
# in each file. Inspect the csv file to understand the structure of the 
# csv file. 
# Hint: use the slides about for ... do ... done
#       use the program tail to get rid of useless lines
#       use the program wc to count things
#       make use of the | symbol to compose         
# output the result in this form:
# <filename> has <number of games> games <newline>
# example output:
# poke.Android.csv has 2 game(s)
# poke.iOS.csv has 1 game(s)

