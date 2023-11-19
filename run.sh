#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <source_file>"
    exit 1
fi

source_file="$1"
executable_name="${source_file%.*}"  # Remove the extension to get the executable name

# Compile the COBOL program
cobc -x -o "$executable_name" "$source_file"

# Check if compilation was successful
if [ $? -eq 0 ]; then
    echo "Compilation successful. Running $executable_name:"
    ./"$executable_name"
else
    echo "Compilation failed."
fi
