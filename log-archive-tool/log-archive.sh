#!/bin/bash

Date=$(TZ='Asia/Kolkata' date +"%d%m%y")
Time=$(TZ='Asia/Kolkata' date +"%H%M%S")
filename=$("$1/log_archive_$Date"_"$Time.tar.gz")

tar -czvf $filname "$1/log_archive_$Date"_"$Time.tar.gz" /var/log

echo ""
echo "=========Logs Archived========="

# By default, for some log files, there are no read permissions granted 
# to the user. So it is necessary to grant access to the user using the following command
# sudo chmod -R g+r /var/logs/