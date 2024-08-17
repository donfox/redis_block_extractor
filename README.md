# Redis_Collector

## Overview
"redis_collector`continuously and/or incrementally monitors and collects blockchain block files, 
detects any gaps in the sequence of collected files, and requests and stores the missing blocks to
remove the gaps Collected blocks are stored locally, and metadata is logged.

The collection process involves the running of a bash shell which then runs three python scripts
concurrently. They collect new block files, detects any missing files and then requests the missing 
files from the on line source and use them to fill the gaps. These concurrent processes communicate 
via. Reds.

## Components
1. **Bash script('run_all_scripts')**: Manages execution of the Python scripts
2. **Python Scripts**:
	- 'blocks_collector.py': Collects blockchain block files and lists their filename to Redis.
	- 'gaps_detector.py': Detects gaps in the sequence of collected block files writing the names
	  of missing files to Redis.
    - `gaps_fixer.py`: Requests and stores missing blocks by monitoring the Redis store for 
      detected gaps.
	    
## Prerequisites
- Python 3.x
- Redis server
- requests library
- logging library

## Installation
1. Clone the repository:
    ```sh
    git clone https://github.com/donfox/redis_indexer.git
    cd redis_indexer
    ```

 2. Create a virtual environment and activate it:
    ```sh
    python3 -m venv venv
    source venv/bin/activate
    ```

3. Install the required Python packages:
    ```sh
    pip install -r requirements.txt
    ```

4. Ensure the Redis server is running on your local machine.

## Usage Running the Scripts
Use the provided shell script `run_all_scripts.sh` to run the Python scripts concurrently. This script ensures that all logs are properly recorded.

1. Make the shell script executable:
    ```sh
    chmod +x run_all_scripts.sh
    ```

2. Run the shell script:
    ```sh
    ./run_all_scripts.sh
    ```