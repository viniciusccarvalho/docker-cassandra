FROM frodenas/java7
MAINTAINER Vinicius Carvalho <viniciusccarvalho@gmail.com>

RUN cd /tmp &&\
    wget http://apache.mirrors.pair.com/cassandra/2.0.10/apache-cassandra-2.0.10-bin.tar.gz && \
    tar -zxvf apache-cassandra-2.0.10-bin.tar.gz && \
    mv /tmp/apache-cassandra-2.0.10/ /cassandra && \
    sed -e 's_/var/lib_ /data _' -i /cassandra/conf/cassandra.yaml && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD scripts /scripts
RUN chmod +x /scripts/*.sh

ENTRYPOINT ["/scripts/cassandra.sh"]

EXPOSE 9160

VOLUME ["/data"]
