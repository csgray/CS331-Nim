# median.nim
# Corey Gray and Curtis Fortenberry
# 28 April 2018
#
# For CS F331 / CSCE A331 Spring 2018
# Demonstrates the Nim programming language by implementing Assignment 5 Exercise C

# Imports
import strutils

# Variables
var
    inputSequence: seq[int] = @[]

# printArray
# Takes an openArray of integers. Does not return.
# Prints the contents of an sequence of arbitrary length.
proc printSequence(oa: openArray[int]) =
    for i in 0..<oa.len:
        echo oa[i]

# main
# Nim doesn't use a "main" but executes all of the unindented blocks,
# so "main" is simply all the statements that are flush-left.
echo """
  __  __ ______ _____ _____          _   _         _           
 |  \/  |  ____|  __ \_   _|   /\   | \ | |       (_)          
 | \  / | |__  | |  | || |    /  \  |  \| |  _ __  _ _ __ ___  
 | |\/| |  __| | |  | || |   / /\ \ | . ` | | '_ \| | '_ ` _ \ 
 | |  | | |____| |__| || |_ / ____ \| |\  |_| | | | | | | | | |
 |_|  |_|______|_____/_____/_/    \_\_| \_(_)_| |_|_|_| |_| |_|
"""

block input:
    echo "Enter integers one at a time. Enter a blank line to stop."
    while true:
        var inputString = readLine(stdin)
        if inputString == "":
            break
        for i in 0..<inputString.len:
            if not isDigit(inputString[i]):
                echo "Only integer inputs are valid."
                break input
        var inputInteger = parseInt(inputString)
        inputSequence.add(inputInteger)
echo "You inputed: "
printSequence(inputSequence)