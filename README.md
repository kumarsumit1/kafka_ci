# kafka_ci

docker run -d -p 2181:2181 -p 9092:9092 --env ADVERTISED_HOST=dockerIP --env ADVERTISED_PORT=9092 --name my_kafka kumarsumit1/kafka_ci

docker exec -it --privileged=true my_kafka /bin/bash

/opt/kafka_2.11-1.0.0/bin/kafka-topics.sh --create --zookeeper dockerIP:2181 --replication-factor 1 --partitions 1 --topic test

/opt/kafka_2.11-1.0.0/bin/kafka-topics.sh --list --zookeeper dockerIP:2181

/opt/kafka_2.11-1.0.0/bin/kafka-topics.sh --zookeeper localhost:2181 --topic test --describe

/opt/kafka_2.11-1.0.0/bin/kafka-console-producer.sh --broker-list dockerIP:9092 --topic test

/opt/kafka_2.11-1.0.0/bin/kafka-console-producer.sh --broker-list dockerIP:9092 --topic test --property "parse.key=true" --property "key.separator=:"

/opt/kafka_2.11-1.0.0/bin/kafka-console-consumer.sh --bootstrap-server dockerIP:9092 --topic test --from-beginning

/opt/kafka_2.11-2.1.0/bin# /opt/kafka_2.11-2.1.0/bin/kafka-consumer-groups.sh --bootstrap-server localhost:9092 --group group_id_1 --describe

## About Docker file :
It uses supervisor utility for more read :
https://www.digitalocean.com/community/tutorials/how-to-install-and-manage-supervisor-on-ubuntu-and-debian-vps



## Kafka frequent commands

Assuming that the following environment variables are set:
- `KAFKA_HOME` where Kafka is installed on local machine (e.g. `/opt/kafka`)
- `ZK_HOSTS` identifies running zookeeper ensemble, e.g. `ZK_HOSTS=192.168.0.99:2181`
- `KAFKA_BROKERS` identifies running Kafka brokers, e.g. `KAFKA_BROKERS=192.168.0.99:9092`

## Server

Start Zookepper and Kafka servers

    $KAFKA_HOME/bin/zookeeper-server-start.sh -daemon
    $KAFKA_HOME/bin/kafka-server-start.sh -daemon config/server.properties

Stop Kafka and Zookeeper servers

    $KAFKA_HOME/bin/kafka-server-stop.sh
    $KAFKA_HOME/bin/zookeeper-server-stop.sh

## Topics 

List topics

    $KAFKA_HOME/bin/kafka-topics.sh --zookeeper $ZK_HOSTS --list

Create topic

    $KAFKA_HOME/bin/kafka-topics.sh --zookeeper $ZK_HOSTS --create --topic $TOPIC_NAME --replication-factor 3 --partitions 3 

Topic-level configuration 

    kafka-configs.sh --zookeeper localhost:2181 --entity-type topics  --describe
    kafka-configs.sh --zookeeper localhost:2181 --entity-type topics --entity-name $TOPIC_NAME --describe
    # Activate log compaction for the topic
    kafka-configs.sh --zookeeper localhost:2181 --entity-type topics --entity-name $TOPIC_NAME --alter --add-config cleanup.policy=compact,delete.retention.ms=604800000

## Producer / Consumer

**Send console input to topic**

    $KAFKA_HOME/bin/kafka-console-producer.sh --broker-list $KAFKA_BROKERS --topic hubble_stream
	
**Send console input to topic in key value format **	
$KAFKA_HOME/bin/kafka-console-producer.sh --broker-list $KAFKA_BROKERS --topic hubble_stream --property "parse.key=true" --property "key.separator=:"

**Send data from file to topic**

    cat hubble_stream.dump.txt | $KAFKA_HOME/bin/kafka-console-producer.sh --broker-list $KAFKA_BROKERS --topic hubble_stream
	
**Read data from topic to console**

    # ----- new way (kafka 0.10) ------
    $KAFKA_HOME/bin/kafka-console-consumer.sh --bootstrap-server $KAFKA_BROKERS --topic mytopic   
    $KAFKA_HOME/bin/kafka-console-consumer.sh --bootstrap-server $KAFKA_BROKERS --topic mytopic --from-beginning --max-messages 100


**Consume/Produce between 2 Kafka clusters**
    
    ./kafka-console-consumer.sh --bootstrap-server $KAFKA_BROKERS_1 --topic mytopic | $KAFKA_HOME/bin/kafka-console-producer.sh --broker-list $KAFKA_BROKERS_2 --topic mytopic

** To check list of group IDs**
$KAFKA_HOME/bin/kafka-consumer-groups.sh --bootstrap-server $KAFKA_BROKERS --list	

**To watch consumers per topic/partition**

    CONSUMER_ID=$(echo "dump"|nc localhost 2181|grep "\/consumers\/"|head -n 1|awk -F'/' '{print $3}')
	
	Find group id / consumer id  using previous list command and then use following command to describe the group.
	
	$KAFKA_HOME/bin/kafka-consumer-groups.sh --bootstrap-server localhost:9092 --group python-grp-1 --describe
	
    # Watch continuosly
    watch -n 3 $KAFKA_HOME/bin/kafka-consumer-groups.sh --bootstrap-server localhost:9092 --group python-grp-1 --describe   

The expected output will be something like this

	TOPIC           PARTITION  CURRENT-OFFSET  LOG-END-OFFSET  LAG             CONSUMER-ID                                             HOST            CLIENT-ID
	test            0          99              99              0               kafka-python-1.4.4-11a7bb9b-fffd-4556-b748-7ee1cf5754f6 /172.17.0.1     kafka-python-1.4.4