#!/bin/bash

file=$(cat ngnix.log)
BOLD=$(tput bold)
NORMAL=$(tput sgr0)

echo -e "=============Ngnix log Analyser=============\n"

echo -e "${BOLD}Top 5 IP addresses with the most requests:${NORMAL}"
grep -Eo '([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3})' ./ngnix.log | sort | uniq -c | sort -nr | head -n 5 | awk '{print $2 " - " $1 " requests"}' 
echo ""

echo -e "${BOLD}Top 5 most requested paths:${NORMAL}"
echo "$file"| awk {'print $7'} | grep -Eo '/[a-zA-Z0-9/_-]+(\?[a-zA-Z0-9=&%_-]+)?' | sort | uniq -c | sort -nr | head -n 5 | awk '{print "api"$2 " - " $1 " requests"}'
echo ""

echo -e "${BOLD}Top 5 response status codes:${NORMAL}"
grep -Eo '\b(100|101|102|103|200|201|202|203|204|205|206|207|208|226|300|301|302|303|304|305|307|308|400|401|402|403|404|405|406|407|408|409|410|411|412|413|414|415|416|417|418|421|422|423|424|425|426|428|429|431|451|500|501|502|503|504|505|506|507|508|510|511)\b' ./ngnix.log | sort | uniq -c | sort -nr | head -n 5 | awk '{print $2 " - " $1" requests"}'

echo -e "\n========================================="