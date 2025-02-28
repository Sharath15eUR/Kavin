#!/bin/bash

# Ensure that the correct number of arguments is provided
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <source_directory> <backup_directory> <file_extension>"
    exit 1
fi

# Assign the arguments to variables
SOURCE_DIR="$1"
BACKUP_DIR="$2"
EXTENSION="$3"

# We are checking if the source dir is valid here and return error if it does not exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: Source directory '$SOURCE_DIR' does not exist."
    exit 1
fi

# Here Check if the backup dir is present if no create one
if [ ! -d "$BACKUP_DIR" ]; then
    echo "Backup directory '$BACKUP_DIR' does not exist. Creating it..."
    mkdir -p "$BACKUP_DIR"
    if [ $? -ne 0 ]; then
        echo "Error: Failed to create backup directory."
        exit 1
    fi
fi
# we use globbing to find files with the specified extension
FILES=($SOURCE_DIR/*$EXTENSION)
# Check if any files match the extension
if [ ${#FILES[@]} -eq 0 ]; then
    echo "No files found with extension '$EXTENSION' in the source directory."
    exit 1
fi
# Initialize variables
export BACKUP_COUNT=0
TOTAL_SIZE=0
# Create an array to store file names and sizes
BACKUP_LOG=""

for FILE in "${FILES[@]}"; do
    # Skip if not a file
    if [ ! -f "$FILE" ]; then
        continue
    fi

    FILE_NAME=$(basename "$FILE")
    FILE_SIZE=$(stat -c %s "$FILE")
    TOTAL_SIZE=$((TOTAL_SIZE + FILE_SIZE))
    echo "Backing up: $FILE_NAME ($FILE_SIZE bytes)"

    # Here we check if the file already exists in the backup dir and if it does we check the time stamp to make sure we backup the files which are recently modified.
    BACKUP_FILE="$BACKUP_DIR/$FILE_NAME"
    if [ -f "$BACKUP_FILE" ]; then
        SOURCE_TIME=$(stat -c %Y "$FILE")
        BACKUP_TIME=$(stat -c %Y "$BACKUP_FILE")

        if [ "$SOURCE_TIME" -gt "$BACKUP_TIME" ]; then
            echo "Overwriting: $BACKUP_FILE is older than source file."
        else
            echo "Skipping: $BACKUP_FILE is newer than source file."
            continue
        fi
    fi
    # Copy the file to the backup directory
    cp "$FILE" "$BACKUP_FILE"
    
    export BACKUP_COUNT=$((BACKUP_COUNT + 1))
    BACKUP_LOG="$BACKUP_LOG$FILE_NAME\n"
done

REPORT_FILE="$BACKUP_DIR/backup_report.log"
{
    echo "Backup Report - $(date)"
    echo "----------------------------"
    echo "Total files processed: $BACKUP_COUNT"
    echo "Total size of files backed up: $TOTAL_SIZE bytes"
    echo "Backup directory: $BACKUP_DIR"
    echo "Files backed up:"
    echo -e "$BACKUP_LOG"
} > "$REPORT_FILE"

echo "Backup completed. Report saved to $REPORT_FILE."
