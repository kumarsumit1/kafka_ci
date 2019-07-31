# Kafka and Zookeeper 
FROM ubuntu:18.04
ENV DEBIAN_FRONTEND noninteractive 
ENV SCALA_VERSION 2.11 
ENV KAFKA_VERSION 2.1.1 
ENV KAFKA_HOME /opt/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION" 
ENV LOG_DIR=/var/log/kafka

# Install Kafka, Zookeeper and other needed things 
RUN apt-get update && \
    apt-get install -y --allow-unauthenticated \
    zookeeper wget supervisor dnsutils vim-tiny \
    curl iputils-ping net-tools jq && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

# http://supergsego.com/apache/kafka/1.0.0/kafka_2.11-1.0.0.tgz http://apache.mirrors.pair.com/kafka/1.0.0/kafka_2.11-1.0.0.tgz

# https://www.howtoforge.com/tutorial/how-to-create-docker-images-with-dockerfile/
	
RUN wget -q http://apache.mirrors.pair.com/kafka/"$KAFKA_VERSION"/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz -O /tmp/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz

RUN tar xfz /tmp/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz -C /opt

RUN rm /tmp/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz
	
ADD scripts/start-kafka.sh /usr/bin/start-kafka.sh
ADD scripts/start-kafka-connector.sh /usr/bin/start-kafka-connector.sh
RUN chmod 777 /usr/bin/start-kafka.sh
RUN chmod 777 /usr/bin/start-kafka-connector.sh

#Custom settings connect-mqtt-source.properties
ADD scripts/.vimrc /root/.vimrc
ADD scripts/connect-mqtt-source.properties $KAFKA_HOME/config/connect-mqtt-source.properties
ADD scripts/connect-mqtt-source.json $KAFKA_HOME/config/connect-mqtt-source.json
ADD scripts/connect-jdbc-sink.json $KAFKA_HOME/config/connect-jdbc-sink.json

# Supervisor config 
ADD supervisor/kafka.conf supervisor/kafka-connect.conf supervisor/zookeeper.conf /etc/supervisor/conf.d/

# 2181 is zookeeper, 9092 is kafka  , 8083 is kafka connect, 9001 supervisord

EXPOSE 2181 9092 8083 9001 3306

CMD ["supervisord", "-n"]