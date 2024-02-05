#!/bin/bash

# Start Zookeeper
kafka/bin/zookeeper-server-start.sh kafka/config/zookeeper.properties &

# Start Kafka broker
kafka/bin/kafka-server-start.sh kafka/config/server1.properties &

# Wait for Kafka to start up
sleep 10

# Run Flask project in the background and give the correct file path here 
python3 'KAFKA&FLASK'/FLASK_MODEL.py &

# Wait for Flask to start up
sleep 10

# Run Kafka consumer
python3 'KAFKA&FLASK'/consumer.py 'KAFKA&FLASK'/KAFKA_MODEL.py 

