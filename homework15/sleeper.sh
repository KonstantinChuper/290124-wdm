#!/bin/bash
current_time=$(date +"%H:%M:%S")
FILES_DIR1="/home"
for i in {1..10};
  do
    echo "$current_time, quantity of processes: $(ps -e | wc -l)"
#    sleep 5
  done
cat /proc/cpuinfo >> "$FILES_DIR1/Script_info.txt"
cat /etc/os-release | grep -w NAME | awk -F '=' '{print$2}' | sed 's/"//g' >> $FILES_DIR1/Script_info.txt
for j in {50..100};
  do
    touch "$FILES_DIR1/$j.txt"
    echo "Files were created in $FILES_DIR1"
  done
   
