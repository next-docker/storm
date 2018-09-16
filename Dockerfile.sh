PARAM_OS_VERSION=$1
PARAM_JDK_VERSION=$2
PARAM_STORM_VERSION=$3
PARAM_OS_NAME=$4

OIFS=$IFS
IFS='.' read -ra JDK_VERSION_ARRAY <<< "$PARAM_JDK_VERSION"

echo "FROM ping2ravi/jdk:${PARAM_JDK_VERSION}_${PARAM_OS_NAME}.${PARAM_OS_VERSION}"
echo ""
echo ""

echo "MAINTAINER Ravi Sharma"


echo "# ${PARAM_OS_NAME} ${PARAM_OS_VERSION}"
echo "# Java Version ${JDK_VERSION_ARRAY[0]} update ${JDK_VERSION_ARRAY[1]}"
echo "# Storm Version ${PARAM_STORM_VERSION}" 
echo "#     http://storm.apache.org/downloads.html"


echo "ENV STORM_VERSION $PARAM_STORM_VERSION"
echo "ENV ZOOKEEPER_HOME /opt/zookeeper/zookeeper-3.4.13"
echo "ENV ZOOKEEPER_VERSION 3.4.13"
echo "ENV STORM_HOME /opt/storm/apache-storm-${PARAM_STORM_VERSION}"
echo "RUN wget -q http://mirror.vorboss.net/apache/zookeeper/zookeeper-3.4.13/zookeeper-3.4.13.tar.gz; gunzip zookeeper-\${ZOOKEEPER_VERSION}.tar.gz ; tar -xvf zookeeper-\${ZOOKEEPER_VERSION}.tar; mkdir -p \${ZOOKEEPER_HOME}; mv zookeeper-\${ZOOKEEPER_VERSION}/* \${ZOOKEEPER_HOME} ; echo ${PATH}; echo \${ZOOKEEPER_HOME}/bin; rm zookeeper-\${ZOOKEEPER_VERSION}.tar ; rm -fR zookeeper-\${ZOOKEEPER_VERSION}; cp \${ZOOKEEPER_HOME}/conf/zoo_sample.cfg \${ZOOKEEPER_HOME}/conf/zoo.cfg"

echo "RUN wget -q http://www-eu.apache.org/dist/storm/apache-storm-\${STORM_VERSION}/apache-storm-\${STORM_VERSION}.tar.gz ;gunzip apache-storm-\${STORM_VERSION}.tar.gz; tar -xvf apache-storm-\${STORM_VERSION}.tar; mkdir -p \${STORM_HOME}; mv apache-storm-\${STORM_VERSION}/* \${STORM_HOME}; rm apache-storm-\${STORM_VERSION}.tar; rm -fR apache-storm-\${STORM_VERSION}"
echo ""
echo "# Install Python, Required by Storm"
echo ""
echo "RUN apt-get install -y python"

echo "ENV PATH \${PATH}:\${STORM_HOME}/bin"
echo "ADD start-storm-cluster.sh /opt/storm/start-storm-cluster.sh"
echo "RUN chmod 755 /opt/storm/start-storm-cluster.sh"
echo "CMD /opt/storm/start-storm-cluster.sh"
IFS=$OIFS
