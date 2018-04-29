# median.nim
# Corey Gray and Curtis Fortenberry
# 28 April 2018
#
# For CS F331 / CSCE A331 Spring 2018
# Demonstrates the Nim programming language by implementing Assignment 5 Exercise C

# Imports
from strutils import intToStr, isDigit, parseInt
from algorithm import sort

# Variables
var
    inputSequence: seq[int] = @[]
    outputMedian: int

# median
# Takes an openArray of intgers.
# Returns the median.
proc median(oa: var openArray[int]): int =
    sort(oa, system.cmp[int])
    var index = int(oa.len/2)
    result = oa[index]

# printArray
# Takes an openArray of integers. Does not return.
# Prints the contents of an sequence of arbitrary length with commas between each element.
proc printSequence(oa: openArray[int]): string =
    result = ""
    for i in 0..oa.len-1:
        result.add(intToStr(oa[i]))
        if i != oa.len-1:
            result.add(", ")

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
        for i in 0..inputString.len-1:
            if not isDigit(inputString[i]):
                echo "Only integer inputs are valid."
                break input
        var inputInteger = parseInt(inputString)
        inputSequence.add(inputInteger)

outputMedian = median(inputSequence)
echo "The median of " & printSequence(inputSequence) & " is: " & intToStr(outputMedian)