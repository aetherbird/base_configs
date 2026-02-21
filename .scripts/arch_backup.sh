#!/bin/bash
set -e

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run with sudo!"
   exit 1
fi

# do not include trailing slash for ARCHIVE_DIR
ARCHIVE_DIR=/nitro/arch-backup
COMPRESSION_LEVEL=4
CORES_TO_RESERVE=2

# define the folders we want to skip in user home dirs
BULK_EXCLUDES=(
    "*/Downloads/*"
    "*/Videos/*"
    "*/Music/*"
    "*/Pictures/*"
    "*/Public/*"
    "*/Templates/*"
    "*/.cache/*"
    "*/.ollama/*"
    "*/.local/share/Trash/*"
)
# ---------------------

BACKUP_TYPE="full"
EXTRA_EXCLUDES=""

# check for --system flag
if [[ "$1" == "--system" ]]; then
    BACKUP_TYPE="system"
    # build the exclude flags
    for dir in "${BULK_EXCLUDES[@]}"; do
        EXTRA_EXCLUDES+=" --exclude=$dir"
    done
    echo "MODE: System-Only (Preserving all .configs, skipping media/downloads)"
else
    echo "MODE: Full Image"
fi

TOTAL_CORES=$(nproc)
USE_CORES=$(( TOTAL_CORES > CORES_TO_RESERVE ? TOTAL_CORES - CORES_TO_RESERVE : 1 ))

TIMESTAMP=$(date +%Y%m%d%H%M)
ARCHIVE_FILE="$ARCHIVE_DIR/arch_${BACKUP_TYPE}_$TIMESTAMP.tar.zst"
START_TIME=$(date +%s)

trap 'echo -e "\nInterrupted! Cleaning up..."; rm -f "$ARCHIVE_FILE"; exit 1' INT

echo "Target: $ARCHIVE_FILE"
echo "------------------------------------------------------"

read -p "Proceed? (y/n): " confirm
if [[ $confirm != [yY] ]]; then exit 1; fi

echo "Compressing $BACKUP_TYPE backup..."

# explicitly exclude the pacman cache, along with EXTRA_EXCLUDES
tar --one-file-system --xattrs --acls -p -P \
    --exclude='/lost+found' \
    --exclude='/nitro' \
    --exclude='/var/cache/pacman/pkg/*' \
    $EXTRA_EXCLUDES \
    -cf - / /boot/efi | zstd -f -T$USE_CORES -$COMPRESSION_LEVEL -o "$ARCHIVE_FILE"

END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))

echo "------------------------------------------------------"
echo "Backup Complete!"
echo "Time Taken: $(($DURATION / 60))m $(($DURATION % 60))s"
echo "Final Size: $(du -sh "$ARCHIVE_FILE" | cut -f1)"
