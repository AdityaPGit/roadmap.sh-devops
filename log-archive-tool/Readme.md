# Server Stats Analyser

**Compresses the log files on a linux machine and stores them in the argument's path in the following format:**

log_archive_ddmmyy_hhmmss.tar.gz

## How to use it?

### 1. Download the file

    curl -O https://github.com/AdityaPGit/roadmap.sh-devops/blob/main/log-archive-tool/server-stats.sh 

### 2. Add execution permissions
    chmod +x server-stats.sh

### 3. Add permissions for reading the ```/var/log/``` directory
    sudo chmod -R u+r /var/logs/

### 4. Execute the file
    ./log-archive.sh /path/to/destination/