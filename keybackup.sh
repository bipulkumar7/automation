#!/bin/bash

# Specify the directory where you want to store your backup files
BACKUP_DIR=/home/bipulkumar/KeyBKP

# Check if ssh is installed, and install it if necessary
if ! command -v ssh >/dev/null 2>&1; then
    echo "ssh client not found. Installing..."
    sudo apt-get update
    sudo apt-get install -y ssh
    echo "Please re-run the script after ssh client is installed."
    exit 0
fi

# Import the first SSH key
if [ -f ~/.ssh/bipul/bipul_privatekey ]; then
    echo "SSH key bipul_privatekey found in ~/.ssh/bipul."
else
    if [ -f $BACKUP_DIR/bipul_privatekey_backup ]; then
        echo "Importing SSH key bipul_privatekey from backup directory..."
        mkdir -p ~/.ssh/bipul
        cp $BACKUP_DIR/bipul_privatekey_backup ~/.ssh/bipul/bipul_privatekey
        chmod 600 ~/.ssh/bipul/bipul_privatekey
        echo "SSH key bipul_privatekey imported successfully!"
    else
        echo "No SSH key found for bipul_privatekey."
    fi
fi

# Import the second SSH key
if [ -f ~/.ssh/computelabs/computelabs_privatekey ]; then
    echo "SSH key computelabs_privatekey found in ~/.ssh/computelabs."
else
    if [ -f $BACKUP_DIR/computelabs_privatekey_backup ]; then
        echo "Importing SSH key computelabs_privatekey from backup directory..."
        mkdir -p ~/.ssh/computelabs
        cp $BACKUP_DIR/computelabs_privatekey_backup ~/.ssh/computelabs/computelabs_privatekey
        chmod 600 ~/.ssh/computelabs/computelabs_privatekey
        echo "SSH key computelabs_privatekey imported successfully!"
    else
        echo "No SSH key found for computelabs_privatekey."
    fi
fi
