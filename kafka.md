# Kafka


## Introduction
1. Kafka is run as a cluster on one or more servers that can span multiple datacenters.
2. The Kafka cluster stores streams of records in categories called topics.
3. Each record consists of a key, a value, and a timestamp. 
4. Kafka has four core APIs:
	* Producer API 
	* Consumer API 
	* Streams API
	* Connector API 
5. In Kafka the communication between the clients and the servers is done with a simple, high-performance, language agnostic TCP protocol. 
6. Java client is provided but other language based implementation is available and managed by third party contributers. 


### Topics and logs
A topic is a multi-subscriber category or feed name to which records are published


* Partition : 
 ***First*** , they allow the log to scale beyond a size that will fit on a single server. Each individual partition must fit on the servers that host it, but a topic may have many partitions so it can handle an arbitrary amount of data. ***Second*** they act as the unit of parallelism


# Configuration :
* Listenrs and Advertised Listenrs   
     https://rmoff.net/2018/08/02/kafka-listeners-explained/
     https://www.confluent.io/blog/kafka-listeners-explained
     


### Kafka Connect 
Kafka Connect is modular in nature, providing a very powerful way of handling integration requirements. Some key components include:

*Connectors – the JAR files that define how to integrate with the data store itself
*Converters – handling serialization and deserialization of data
*Transforms – optional in-flight manipulation of messages

https://talks.rmoff.net/QZ5nsS#sgiS8XE

https://videos.confluent.io/watch/wyc1oqmkoQj4k5WM9CuAwg?

https://github.com/confluentinc/demo-scene/tree/master/kafka-connect-zero-to-hero
https://github.com/confluentinc/demo-scene/tree/master/connect-deepdive


https://stackoverflow.com/questions/45928768/kafka-connect-jdbc-sink-connector-not-working


http://db.geeksinsight.com/2019/03/31/etl-with-kafka-and-oracle/

https://www.youtube.com/watch?v=dOnzikYnQ4g

https://www.confluent.io/blog/kafka-connect-deep-dive-jdbc-source-connector

https://www.confluent.io/blog/kafka-connect-deep-dive-converters-serialization-explained

https://www.confluent.io/blog/kafka-connect-deep-dive-error-handling-dead-letter-queues
https://www.ibm.com/support/knowledgecenter/en/SSPT3X_4.2.5/com.ibm.swg.im.infosphere.biginsights.admin.doc/doc/admin_kafka_jdbc_sink.html

https://www.confluent.io/blog/simplest-useful-kafka-connect-data-pipeline-world-thereabouts-part-1/
