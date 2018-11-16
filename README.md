# kafka_ci

docker run -d -p 2181:2181 -p 9092:9092 --env ADVERTISED_HOST=dockerIP --env ADVERTISED_PORT=9092 --name my_kafka kumarsumit1/kafka_ci

docker exec -it --privileged=true my_kafka /bin/bash

/opt/kafka_2.11-1.0.0/bin/kafka-topics.sh --create --zookeeper dockerIP:2181 --replication-factor 1 --partitions 1 --topic test

/opt/kafka_2.11-1.0.0/bin/kafka-topics.sh --list --zookeeper dockerIP:2181

/opt/kafka_2.11-1.0.0/bin/kafka-topics.sh --zookeeper localhost:2181 --topic test --describe

/opt/kafka_2.11-1.0.0/bin/kafka-console-producer.sh --broker-list dockerIP:9092 --topic test

/opt/kafka_2.11-1.0.0/bin/kafka-console-consumer.sh --zookeeper dockerIP:2181 --topic test --from-beginning