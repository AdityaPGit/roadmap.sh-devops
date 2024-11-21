#!/bin/bash

echo "==============Server Stats=============="

echo ""

# CPU Usage
cpuusage=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8"%"}')
echo "CPU usage: $cpuusage"

memory=$(free -h)
memoryp=$(free)

# Extracting human readable values
totalMemory=$(echo "$memory" | grep Mem | awk '{print $2}')
usedMemory=$(echo "$memory" | grep  Mem | awk '{print $3}')
freeMemory=$(echo "$memory" | grep Mem | awk '{print $4}')

# Extracting whole values
PtotalMemory=$(echo "$memoryp" | grep Mem | awk '{print $2}')
PusedMemory=$(echo "$memoryp" | grep Mem | awk '{print $3}')

# Calculating % of memory used
usedMemoryPerc=$(echo "$PusedMemory $PtotalMemory" | awk '{print $1/$2*100}')
freeMemoryPerc=$(echo "$usedMemoryPerc" | awk '{print 100-$1}')

storage=$(df / -h)
storagep=$(df /)

# Extracting human readable values
totalStorage=$(echo "$storage" | grep / | awk '{print $2}')
usedStorage=$(echo "$storage" | grep / | awk '{print $3}')
freeStorage=$(echo "$storage" | grep / | awk '{print $4}')
PusedStorage=$(echo "$storage" | grep / | awk '{print $5}')
PfreeStorage=$(echo "$PusedStorage" | awk '{print 100 - $1}')

echo  ""

echo "Used Memory: $usedMemory | $usedMemoryPerc"%""
echo "Free Memory: $freeMemory | $freeMemoryPerc"%""

echo ""

echo "Used Storage: $usedStorage | $PusedStorage"
echo "Free Storage: $freeStorage | $PfreeStorage"%""

echo ""

echo "Top 5 Processes according to CPU usage:"
echo "---------------------------------------"

ps -eo pid,%cpu,%mem,comm --sort=-%cpu | head -n 6

echo ""

echo "Top 5 Processes according to CPU usage:"
echo "---------------------------------------"

ps -eo pid,%cpu,%mem,comm --sort=-%mem | head -n 6
