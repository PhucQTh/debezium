ARG DEBEZIUM_VERSION=2.4
FROM debezium/connect:${DEBEZIUM_VERSION}
ENV KAFKA_CONNECT_JDBC_DIR=$KAFKA_CONNECT_PLUGINS_DIR/kafka-connect-jdbc


RUN mkdir $KAFKA_CONNECT_JDBC_DIR 
COPY  ./kafka-connect-jdbc-10.7.4.jar $KAFKA_CONNECT_JDBC_DIR/
COPY  ./mysql-connector-j-8.1.0.jar $KAFKA_CONNECT_JDBC_DIR/
COPY  ./kafka-connect-timestamp-converter-1.0.jar $KAFKA_CONNECT_JDBC_DIR/