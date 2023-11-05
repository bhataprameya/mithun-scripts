#!/bin/bash

# Check for the correct number of arguments
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 source_folder destination_folder input_csv"
    exit 1
fi

source_folder="$1"
destination_folder="$2"
input_csv="$3"

# Check if source and destination folders exist
if [ ! -d "$source_folder" ]; then
    echo "Source folder does not exist: $source_folder"
    exit 1
fi

if [ ! -d "$destination_folder" ]; then
    echo "Destination folder does not exist: $destination_folder"
    exit 1
fi

# Loop through the CSV file and copy files from source to destination
while IFS=, read -r file_name
do
    # Create a new file name with "MCC_" prefix and ".jpeg" extension
    new_file_name="MCC_$file_name.jpeg"
    
    # Check if the file exists in the source folder
    if [ -f "$source_folder/$new_file_name" ]; then
        # Copy the file to the destination folder with the new name
        cp "$source_folder/$new_file_name" "$destination_folder/$new_file_name"
        echo "Copied: $new_file_name as $new_file_name"
    else
        echo "File not found in source folder: $new_file_name"
    fi
done < "$input_csv"

echo "Copy process completed."

