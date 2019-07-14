# Kafka and Zookeeper 
FROM ubuntu:18.04
ENV DEBIAN_FRONTEND noninteractive 
ENV SCALA_VERSION 2.11 
ENV KAFKA_VERSION 2.1.1 
ENV KAFKA_HOME /opt/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION" 

# Install Kafka, Zookeeper and other needed things 
RUN apt-get update && \
    apt-get install -y --allow-unauthenticated zookeeper wget supervisor dnsutils vim-tiny curl && \
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

# Supervisor config 

ADD supervisor/kafka.conf supervisor/zookeeper.conf /etc/supervisor/conf.d/
# 2181 is zookeeper, 9092 is kafka  , 8083 is kafka connect

EXPOSE 2181 9092 8083

CMD ["supervisord", "-n"]