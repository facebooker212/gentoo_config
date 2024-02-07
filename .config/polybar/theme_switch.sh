#!/bin/bash

# Define directory
WALLPAPER_DIR="$HOME/wallpapers"

# Create a file to store the current index
STATE_FILE="$HOME/.theme_rotation_state"
touch $STATE_FILE

# Read the current index from the state file
CURRENT_INDEX=$(cat $STATE_FILE)

# Get the list of wallpapers in the directory
WALLPAPERS=("$WALLPAPER_DIR"/*)

# Calculate the next index
NEXT_INDEX=$(( (CURRENT_INDEX + 1) % ${#WALLPAPERS[@]} ))

# Get the next wallpaper
NEXT_WALLPAPER=${WALLPAPERS[NEXT_INDEX]}

# Run wal to generate color palette
wal -i "$NEXT_WALLPAPER" > /dev/null 2>&1

# Set wallpaper with feh
feh --bg-scale "$NEXT_WALLPAPER" > /dev/null 2>&1

# Update the state file with the next index
echo "$NEXT_INDEX" > $STATE_FILE
