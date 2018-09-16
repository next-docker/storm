FROM ping2ravi/jdk:oracle_jdk8.131.11_ubuntu.16.04


MAINTAINER Ravi Sharma
# ubuntu 16.04
# Java Version oracle_jdk8 update 131
# Storm Version 1.2.2
#     http://storm.apache.org/downloads.html
ENV STORM_VERSION 1.2.2
ENV ZOOKEEPER_HOME /opt/zookeeper/zookeeper-3.4.13
ENV ZOOKEEPER_VERSION 3.4.13
ENV STORM_HOME /opt/storm/apache-storm-1.2.2
RUN wget -q http://mirror.vorboss.net/apache/zookeeper/zookeeper-3.4.13/zookeeper-3.4.13.tar.gz; gunzip zookeeper-${ZOOKEEPER_VERSION}.tar.gz ; tar -xvf zookeeper-${ZOOKEEPER_VERSION}.tar; mkdir -p ${ZOOKEEPER_HOME}; mv zookeeper-${ZOOKEEPER_VERSION}/* ${ZOOKEEPER_HOME} ; echo /usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/ravisharma/work/tools/java/current/bin:/Users/ravisharma/work/tools/maven/current/bin; echo ${ZOOKEEPER_HOME}/bin; rm zookeeper-${ZOOKEEPER_VERSION}.tar ; rm -fR zookeeper-${ZOOKEEPER_VERSION}; cp ${ZOOKEEPER_HOME}/conf/zoo_sample.cfg ${ZOOKEEPER_HOME}/conf/zoo.cfg
RUN wget -q http://www-eu.apache.org/dist/storm/apache-storm-${STORM_VERSION}/apache-storm-${STORM_VERSION}.tar.gz ;gunzip apache-storm-${STORM_VERSION}.tar.gz; tar -xvf apache-storm-${STORM_VERSION}.tar; mkdir -p ${STORM_HOME}; mv apache-storm-${STORM_VERSION}/* ${STORM_HOME}; rm apache-storm-${STORM_VERSION}.tar; rm -fR apache-storm-${STORM_VERSION}

# Install Python, Required by Storm

RUN apt-get install -y python
ENV PATH ${PATH}:${STORM_HOME}/bin
ADD start-storm-cluster.sh /opt/storm/start-storm-cluster.sh
RUN chmod 755 /opt/storm/start-storm-cluster.sh
CMD /opt/storm/start-storm-cluster.sh
