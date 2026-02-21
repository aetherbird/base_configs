#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "Error: This script must be run with sudo!"
   exit 1
fi

while [[ "$#" -gt 0 ]]; do
    case $1 in
        -s|--source) SOURCE_FILE="$2"; shift ;;
        -d|--dest)   DEST_DIR="$2"; shift ;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

if [[ -z "$SOURCE_FILE" || -z "$DEST_DIR" ]]; then
    echo "Usage: sudo ./arch_restore.sh -s /path/to/backup.tar.zst -d /mnt"
    exit 1
fi

if [[ ! -f "$SOURCE_FILE" ]]; then
    echo "Error: Source file '$SOURCE_FILE' not found."
    exit 1
fi

if [[ ! -d "$DEST_DIR" ]]; then
    echo "Error: Destination directory '$DEST_DIR' does not exist."
    echo "Hint: Did you forget to mount your drive to /mnt?"
    exit 1
fi

echo "--- RESTORE PREPARATION ---"
echo "Source Archive: $SOURCE_FILE"
echo "Target Location: $DEST_DIR"
echo "---------------------------"
echo "WARNING: This will overwrite files at the destination."
read -p "Type 'RESTORE' to confirm: " confirm

if [[ "$confirm" != "RESTORE" ]]; then
    echo "Aborting."
    exit 1
fi

echo "Extracting... please wait."

zstd -dc "$SOURCE_FILE" | tar -xpP --xattrs --acls -C "$DEST_DIR" -f -

echo "---------------------------"
echo "Restore process finished."
