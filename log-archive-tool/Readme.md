# Log Archive Tool

**Compresses the log files on a linux machine and stores them in the argument's path in the following format:**

log_archive_ddmmyy_hhmmss.tar.gz

## How to use it?

### 1. Download the file

    curl -O https://raw.githubusercontent.com/AdityaPGit/roadmap.sh-devops/refs/heads/main/log-archive-tool/log-archive.sh

### 2. Add execution permissions
    chmod +x log-archive.sh

### 3. Add permissions for reading the ```/var/log/``` directory
    sudo chmod -R u+r /var/log/

### 4. Execute the file
    ./log-archive.sh /path/to/destination/

#### Modify the ```/path/to/destination/``` according to you desired directory or use ```.``` to make the compressed file in the current directory