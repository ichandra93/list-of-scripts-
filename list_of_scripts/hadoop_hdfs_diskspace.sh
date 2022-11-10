#!/bin/bash

##This is for 10.14.22.151 hadoop server##

timestamp=`date '+%A %W %Y %X'`
disk_space=`df / --output='pcent' | grep -o "[0-9]*"`
old_hadoop_log=`find /var/log/hadoop/hdfs -type f -printf '%T@ %p\n' | grep .log | sort -nr | tail -1 | cut -f2- -d" " `
if [ $disk_space > 90 ]; then
    echo "'$timestamp' going to delete '$old_hadoop_log' file" >> /var/log/hadoop/hdfs/cron_delete.txt
    rm -f $old_hadoop_log
fi 