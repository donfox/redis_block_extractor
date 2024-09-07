#!/bin/bash

#
# run_all_scripts.sh
#            
# This is a exercise using the Redis data store for communication between three
# scripts rather than using direct function calls.
#
# This script runs all three python programs concurrently which together extract 
# blockchain block files from an online API and loads them into a local 
# directory.  Each program contains one function. 
#

# Directory for logging
LOG_DIR="logs"  # Define the log directory path here
SCRIPT_LOG="$LOG_DIR/script.log"
mkdir -p $LOG_DIR

# Log start time
echo "Script started at $(date)" >> "$SCRIPT_LOG"

# Activate your virtual environment if needed
# source /path/to/your/virtualenv/bin/activate

# Run the blocks_collector.py script
python3 blocks_extractor.py >> "$LOG_DIR/blocks_exractor.log" 2>&1 &

# Run the gaps_detector.py script
python3 gaps_detector.py >> "$LOG_DIR/gaps_detector.log" 2>&1 &

# Run the gaps_fixer.py script
python3 gaps_fixer.py >> "$LOG_DIR/gaps_fixer.log" 2>&1 &

# Wait for all background processes to complete
wait

# Log completion time
echo "All scripts completed at $(date)" >> "$SCRIPT_LOG"

# Deactivate your virtual environment if it was activated
# deactivate