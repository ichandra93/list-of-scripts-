#!/bin/bash

if yarn application -list | grep -i om-kafka-river; then
    echo "Kafka River is running"
else
    echo "Kafka is not running, starting the job"
    sh spark.sh
fi        