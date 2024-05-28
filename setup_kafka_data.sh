#!/bin/bash

# List of directories to check and create
DATA_DIRS=("kafka_data_1" "kafka_data_2" "zookeeper_data")

# Iterate over each directory
for DIR in "${DATA_DIRS[@]}"; do
  if [ ! -d "$DIR" ]; then
    echo "Directory $DIR does not exist. Creating it..."
    mkdir -p $DIR
    chmod -R 755 $DIR
  else
    echo "Directory $DIR already exists."
    chmod -R 755 $DIR
  fi
done
