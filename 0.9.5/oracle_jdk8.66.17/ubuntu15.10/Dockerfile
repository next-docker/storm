FROM ping2ravi/jdk:oracle_jdk8.66.17_ubuntu.15.10


MAINTAINER Ravi Sharma
# Ubuntu 15.10
# Java Version oracle_jdk8 update 66
# Storm Version 0.9.5
#     http://storm.apache.org/downloads.html
ENV STORM_VERSION 0.9.5
ENV STORM_HOME /opt/storm/apache-storm-${STORM_VERSION}
RUN  wget http://mirrors.muzzy.org.uk/apache/storm/apache-storm-${STORM_VERSION}/apache-storm-${STORM_VERSION}.tar.gz ;gunzip apache-storm-${STORM_VERSION}.tar.gz; tar -xvf apache-storm-${STORM_VERSION}.tar; mkdir -p ${STORM_HOME}; mv apache-storm-${STORM_VERSION}/* ${STORM_HOME}; rm apache-storm-${STORM_VERSION}.tar; rm -fR apache-storm-${STORM_VERSION}
ENV PATH ${PATH}:${STORM_HOME}/bin
