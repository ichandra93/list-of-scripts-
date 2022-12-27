#!/bin/bash

timestamp=`date '+%A %W %Y %X'`
if yarn application -list | grep -i littlefinger; then
    echo "$timestamp littlefinger is running"
else
    echo "$timestamp littlefinger is not running, starting the job" >> /root/scripts/littlefinger/cron_start_littlefinger.log
    cd /root/scripts/littlefinger && sh run_azure.sh
fi