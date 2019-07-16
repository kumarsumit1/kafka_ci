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
     





https://community.hortonworks.com/questions/77336/nifi-best-practices-for-error-handling.html

https://community.hortonworks.com/articles/76598/nifi-error-handling-design-pattern-1.html

https://kisstechdocs.wordpress.com/2015/01/15/creating-a-limited-failure-loop-in-nifi/


https://medium.com/@harittweets/getting-started-with-apache-kafka-fe5a0b10a3be

docker run -i -t centos /bin/bash


docker run --name nifi -p 8080:8080 -d apache/nifi:latest


docker run -i -t apache/nifi /bin/bash

docker exec -i -t distracted_swartz /bin/bash


wget -q http://mirror.stjschools.org/public/apache/nifi/1.5.0/nifi-toolkit-1.5.0-bin.tar.gz -O /opt/nifi/nifi-toolkit-1.5.0-bin.tar.gz


tar -xvzf nifi-toolkit-1.5.0-bin.tar.gz














This will provide a running instance, exposing the instance UI to the host system on at port 8080,
viewable at http://localhost:8080/nifi


docker run --name nifi \
  -p 9090:9090 \
  -d \
  -e NIFI_WEB_HTTP_PORT='9090'
  apache/nifi:latest

For a list of the environment variables recognised in this build, look into the .sh/secure.sh and .sh/start.sh scripts
----------------------------------------------------------------------------------------------------------------------------
docker run -i -t -h node.monocluster.com -p 2181:2181 -p 9092:9092 -p 8080:8080 --name amb1 --entrypoint /bin/bash kumarsumit1/dockerambari 

docker run -i -t -h node.monocluster.com -p 2181:2181 -p 9092:9092 -p 8080:8080 --name amb ambari /bin/bash

docker run -i -t --network=host ubuntu:16.04 /bin/bash


docker run -i -t --network=host ubuntu:16.04 /bin/bash


docker exec -it --privileged=true ubuntu:16.04 /bin/bash

docker exec -it --privileged=true amb1 /bin/bash

apt-get -qq update
apt-get -qq -y install wget
apt-get install vim  
apt-get install ssh
apt-get install openssh-client
apt-get install curl
apt-get install unzip
apt-get install tar
apt-get install openssl


Checking 'sudo' package on remote host...
jsch

apt-get install ntp
update-rc.d ntp defaults

wget -O /etc/apt/sources.list.d/ambari.list http://public-repo-1.hortonworks.com/ambari/ubuntu16/2.x/updates/2.6.1.5/ambari.list

apt-key adv --recv-keys --keyserver keyserver.ubuntu.com B9733A7A07513CAD

apt-get update



apt-get install mysql-server
apt-get install libmysql-java
service mysql start

ambari-server setup --jdbc-db=mysql --jdbc-driver=/usr/share/java/mysql.jar

/usr/share/java/mysql.jar


CREATE USER 'hive'@'localhost' IDENTIFIED BY 'kylo';

GRANT ALL PRIVILEGES ON *.* TO 'hive'@'localhost';

CREATE USER 'hive'@'%' IDENTIFIED BY 'kylo';

GRANT ALL PRIVILEGES ON *.* TO 'hive'@'%';

CREATE USER 'hive'@'node.monocluster.com' IDENTIFIED BY 'kylo';

GRANT ALL PRIVILEGES ON *.* TO 'hive'@'node.monocluster.com';

FLUSH PRIVILEGES;

CREATE DATABASE hive;





 service ntp start
 service ssh start
 

docker inspect <container id> | grep "IPAddress"

172.17.0.2


pg_createcluster 9.5 main --start
Creating new cluster 9.5/main ...
  config /etc/postgresql/9.5/main
  data   /var/lib/postgresql/9.5/main
  locale C
  socket /var/run/postgresql
  port   5432
root@node:/usr# service postgresql status
9.5/main (port 5432): online

service postgresql status
service postgresql restart

To use the default PostgreSQL database, named ambari, with the default username and password (ambari/bigdata)


apt-get install libpostgresql-jdbc-java

ambari-server setup --jdbc-db=postgres --jdbc-driver=/usr/share/java/postgresql.jar



psql -U ambari -h 127.0.0.1 ambari

https://docs.hortonworks.com/HDPDocuments/HDP2/HDP-2.6.4/bk_support-matrices/content/ch_matrices-ambari.html#ambari_os


Pseudo terminal will not be ssh : conect to localhost cannot assign requested addr




-----------------------------------------------------------------------------------------------------------------------------------
docker run -d -p 2181:2181 -p 9092:9092 --env ADVERTISED_HOST=10.0.75.1 --env ADVERTISED_PORT=9092 --name my_kafka spotify/kafka


docker run -d -p 2181:2181 -p 9092:9092 --env ADVERTISED_HOST=10.0.75.1 --env ADVERTISED_PORT=9092 --name my_kafka kumarsumit1/kafka_ci

docker exec -it --privileged=true my_kafka /bin/bash


/opt/kafka_2.11-1.0.0/bin/kafka-topics.sh --create --zookeeper 10.0.75.1:2181 --replication-factor 1 --partitions 1 --topic test

/opt/kafka_2.11-1.0.0/bin/kafka-topics.sh --list --zookeeper 10.0.75.1:2181

/opt/kafka_2.11-1.0.0/bin/kafka-topics.sh --zookeeper localhost:2181 --topic test --describe

/opt/kafka_2.11-1.0.0/bin/kafka-console-producer.sh --broker-list 10.0.75.1:9092 --topic test

/opt/kafka_2.11-1.0.0/bin/kafka-console-consumer.sh --zookeeper 10.0.75.1:2181 --topic test --from-beginning




docker run --rm -p 2181:2181 -p 3030:3030 -p 8081-8083:8081-8083 -p 9581-9585:9581-9585 -p 9092:9092 -e ADV_HOST=10.0.75.1 landoop/fast-data-dev:latest



http://10.0.75.1:3030


bin/kafka-topics.sh --create \
    --zookeeper localhost:2181 \
    --replication-factor 1 \
    --partitions 1 \
    --topic test
	
-------------------------
root@moby:/# apt-cache showpkg ambari-server
Package: ambari-server
Versions:
2.6.1.5-3 (/var/lib/apt/lists/public-repo-1.hortonworks.com_ambari_ubuntu16_2.x_updates_2.6.1.5_dists_Ambari_main_binary-amd64_Packages.lz4)
 Description Language:
                 File: /var/lib/apt/lists/public-repo-1.hortonworks.com_ambari_ubuntu16_2.x_updates_2.6.1.5_dists_Ambari_main_binary-amd64_Packages.lz4
                  MD5: c6d904389bc0d41429b0c7c52796924c


Reverse Depends:
Dependencies:
2.6.1.5-3 - openssl (0 (null)) postgresql (2 8.1) python (2 2.6) curl (0 (null))
Provides:
2.6.1.5-3 -
Reverse Provides:
root@moby:/# apt-cache showpkg ambari-agent
Package: ambari-agent
Versions:
2.6.1.5-3 (/var/lib/apt/lists/public-repo-1.hortonworks.com_ambari_ubuntu16_2.x_updates_2.6.1.5_dists_Ambari_main_binary-amd64_Packages.lz4)
 Description Language:
                 File: /var/lib/apt/lists/public-repo-1.hortonworks.com_ambari_ubuntu16_2.x_updates_2.6.1.5_dists_Ambari_main_binary-amd64_Packages.lz4
                  MD5: 65ddc175277c4d4f172223d875012a91


Reverse Depends:
Dependencies:
2.6.1.5-3 - openssl (0 (null)) zlibc (0 (null)) python (2 2.6)
Provides:
2.6.1.5-3 -
Reverse Provides:
root@moby:/# apt-cache showpkg ambari-metrics-assembly
Package: ambari-metrics-assembly
Versions:
2.6.1.5-3 (/var/lib/apt/lists/public-repo-1.hortonworks.com_ambari_ubuntu16_2.x_updates_2.6.1.5_dists_Ambari_main_binary-amd64_Packages.lz4)
 Description Language:
                 File: /var/lib/apt/lists/public-repo-1.hortonworks.com_ambari_ubuntu16_2.x_updates_2.6.1.5_dists_Ambari_main_binary-amd64_Packages.lz4
                  MD5: c604a9ec482bcdd63ec5a13eb7e00f6f


Reverse Depends:
Dependencies:
2.6.1.5-3 - python (2 2.6) python-dev (0 (null)) gcc (0 (null))
Provides:
2.6.1.5-3 -
Reverse Provides:
root@moby:/# apt-get install ambari-server
root@moby:/# apt-get install ambari-server
Reading package lists... Done
Building dependency tree
Reading state information... Done
The following additional packages will be installed:
  cron curl dh-python distro-info-data file ifupdown iproute2 isc-dhcp-client isc-dhcp-common krb5-locales libasn1-8-heimdal libatm1 libbsd0 libcurl3-gnutls libdns-export162 libedit2
  libexpat1 libffi6 libgmp10 libgnutls30 libgssapi-krb5-2 libgssapi3-heimdal libhcrypto4-heimdal libheimbase1-heimdal libheimntlm0-heimdal libhogweed4 libhx509-5-heimdal libicu55
  libisc-export160 libk5crypto3 libkeyutils1 libkrb5-26-heimdal libkrb5-3 libkrb5support0 libldap-2.4-2 libmagic1 libmnl0 libmpdec2 libnettle6 libp11-kit0 libpopt0 libpq5 libpython-stdlib
  libpython2.7-minimal libpython2.7-stdlib libpython3-stdlib libpython3.5-minimal libpython3.5-stdlib libroken18-heimdal librtmp1 libsasl2-2 libsasl2-modules libsasl2-modules-db
  libsensors4 libsqlite3-0 libtasn1-6 libwind0-heimdal libxml2 libxslt1.1 libxtables11 locales logrotate lsb-release mime-support netbase postgresql postgresql-9.5 postgresql-client-9.5
  postgresql-client-common postgresql-common postgresql-contrib-9.5 python python-minimal python2.7 python2.7-minimal python3 python3-minimal python3.5 python3.5-minimal sgml-base
  ssl-cert sysstat tzdata ucf xml-core xz-utils
Suggested packages:
  anacron checksecurity exim4 | postfix | mail-transport-agent libdpkg-perl ppp rdnssd iproute2-doc resolvconf avahi-autoipd isc-dhcp-client-ddns apparmor gnutls-bin krb5-doc krb5-user
  libsasl2-modules-otp libsasl2-modules-ldap libsasl2-modules-sql libsasl2-modules-gssapi-mit | libsasl2-modules-gssapi-heimdal lm-sensors mailx lsb postgresql-doc locales-all
  postgresql-doc-9.5 libdbd-pg-perl python-doc python-tk python2.7-doc binutils binfmt-support python3-doc python3-tk python3-venv python3.5-venv python3.5-doc sgml-base-doc
  openssl-blacklist isag debhelper
The following NEW packages will be installed:
  ambari-server cron curl dh-python distro-info-data file ifupdown iproute2 isc-dhcp-client isc-dhcp-common krb5-locales libasn1-8-heimdal libatm1 libbsd0 libcurl3-gnutls libdns-export162
  libedit2 libexpat1 libffi6 libgmp10 libgnutls30 libgssapi-krb5-2 libgssapi3-heimdal libhcrypto4-heimdal libheimbase1-heimdal libheimntlm0-heimdal libhogweed4 libhx509-5-heimdal libicu55
  libisc-export160 libk5crypto3 libkeyutils1 libkrb5-26-heimdal libkrb5-3 libkrb5support0 libldap-2.4-2 libmagic1 libmnl0 libmpdec2 libnettle6 libp11-kit0 libpopt0 libpq5 libpython-stdlib
  libpython2.7-minimal libpython2.7-stdlib libpython3-stdlib libpython3.5-minimal libpython3.5-stdlib libroken18-heimdal librtmp1 libsasl2-2 libsasl2-modules libsasl2-modules-db
  libsensors4 libsqlite3-0 libtasn1-6 libwind0-heimdal libxml2 libxslt1.1 libxtables11 locales logrotate lsb-release mime-support netbase postgresql postgresql-9.5 postgresql-client-9.5
  postgresql-client-common postgresql-common postgresql-contrib-9.5 python python-minimal python2.7 python2.7-minimal python3 python3-minimal python3.5 python3.5-minimal sgml-base
  ssl-cert sysstat tzdata ucf xml-core xz-utils
0 upgraded, 87 newly installed, 0 to remove and 2 not upgraded.
Need to get 783 MB of archives.
After this operation, 947 MB of additional disk space will be used.
	