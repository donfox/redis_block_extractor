#!/bin/bash

# Directory for loggingpwd
  
LOG_DIR="logs"  # Define the log directory path here
SCRIPT_LOG="$LOG_DIR/script.log"
mkdir -p $LOG_DIR


# Log start time
echo "Script started at $(date)" >> "$SCRIPT_LOG"

# Activate your virtual environment if needed
# source /path/to/your/virtualenv/bin/activate

# Run the blocks_collector.py script
python3 blocks_collector.py >> "$LOG_DIR/blocks_collector.log" 2>&1 &

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