#!/bin/bash
#red eye
read -p "Enter source directory: " src_dir

# Checks if source directory exists
if [ ! -d "$src_dir" ]; then
  echo "Error: Source directory does not exist."
  exit 1
fi

timestamp=$(date +%Y-%m-%d_%H-%M)

mkdir -p "backup_$timestamp"

cd "backup_$timestamp"
echo "Backup directory created: backup_$timestamp. Copying .txt files."

# Makes a copy of all .txt files from current (source) directory to backup directory
cp  -r "$src_dir"/*.txt .

echo "Backup completed!"

# Counts number of .txt files in current directory and prints it
echo "Files backed up: $(ls ./*.txt)"



# #!/bin/bash

# # Prompt user for source directory
# read -p "Enter source directory: " source_dir

# # Check if source directory exists
# if [ ! -d "$source_dir" ]; then
#   echo "Error: Source directory does not exist."
#   exit 1
# fi

# # Create timestamp
# timestamp=$(date +%Y-%m-%d_%H-%M)

# # Create backup directory name with timestamp
# backup_dir="backup_${timestamp}"

# # Create backup directory if it doesn't exist
# mkdir -p "$backup_dir"
# echo "Backup directory created: $backup_dir"

# # Copy all .txt files to backup directory
# echo "Copying .txt files..."
# cp "$source_dir"/*.txt "$backup_dir" 2>/dev/null

# # Count number of .txt files copied
# file_count=$(ls "$backup_dir"/*.txt 2>/dev/null | wc -l)

# # Display result
# echo
# echo "Backup complete! Files backed up: $file_count"
