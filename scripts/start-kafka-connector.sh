#!/bin/bash

# Optional ENV variables:
# * CONNECT_PLUGIN_PATH: Set to a list of filesystem paths separated by commas (,) to enable class loading isolation for plugins
# 						(connectors, converters, transformations). The list should consist of top level directories that include
# 						any combination of:
# 						a) directories immediately containing jars with plugins and their dependencies
# 						b) uber-jars with plugins and their dependencies
# 						c) directories immediately containing the package directory structure of classes of plugins and their dependencies
# 						Note: symlinks will be followed to discover dependencies or plugins.
# 						Examples:
# 						plugin.path=/usr/local/share/java,/usr/local/share/kafka/plugins,/opt/connectors,




# Set the external host and port
if [ ! -z "$CONNECT_PLUGIN_PATH" ]; then
    echo "connect plugin path : $CONNECT_PLUGIN_PATH"
    if grep -q "^plugin.path" $KAFKA_HOME/config/connect-standalone.properties; then
        sed -r -i "s/#(plugin.path)=(.*)/\1=$CONNECT_PLUGIN_PATH/g" $KAFKA_HOME/config/connect-standalone.properties
    else
	    echo '\n' >> $KAFKA_HOME/config/connect-standalone.properties
        echo "plugin.path=$CONNECT_PLUGIN_PATH" >> $KAFKA_HOME/config/connect-standalone.properties
    fi
fi

if [ ! -z "$CONNECT_REST_PORT" ]; then
    echo "connect rest port: $CONNECT_REST_PORT"
    if grep -q "^rest.port" $KAFKA_HOME/config/connect-standalone.properties; then
        sed -r -i "s/#(rest.port)=(.*)/\1=$CONNECT_REST_PORT/g" $KAFKA_HOME/config/connect-standalone.properties
    else
        echo "rest.port=$CONNECT_REST_PORT" >> $KAFKA_HOME/config/connect-standalone.properties
    fi
fi


# wait for Kafka to start up
# No such command at of now
#until /usr/share/zookeeper/bin/zkServer.sh status; do
# sleep 0.1
#done


tail -f $KAFKA_HOME/logs/server.log | while read LOGLINE
do
 echo ${LOGLINE}
 [[ "${LOGLINE}" == *'started'* ]] && pkill -P $$ tail
 echo "teste"
done


echo "Hellow"
# Run Kafka
$KAFKA_HOME/bin/connect-standalone.sh $KAFKA_HOME/config/connect-standalone.properties