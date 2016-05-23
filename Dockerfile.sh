PARAM_UBUNTU_VERSION=$1
PARAM_JDK_VERSION=$2
PARAM_STORM_VERSION=$3

OIFS=$IFS
IFS='.' read -ra JDK_VERSION_ARRAY <<< "$PARAM_JDK_VERSION"

echo "FROM ping2ravi/jdk:${PARAM_JDK_VERSION}_ubuntu.${PARAM_UBUNTU_VERSION}"
echo ""
echo ""

echo "MAINTAINER Ravi Sharma"


echo "# Ubuntu ${PARAM_UBUNTU_VERSION}"
echo "# Java Version ${JDK_VERSION_ARRAY[0]} update ${JDK_VERSION_ARRAY[1]}"
echo "# Storm Version ${PARAM_STORM_VERSION}" 
echo "#     http://storm.apache.org/downloads.html"


echo "ENV STORM_VERSION $PARAM_STORM_VERSION"

echo "ENV STORM_HOME /opt/storm/apache-storm-\${STORM_VERSION}"


echo "RUN  wget http://mirrors.muzzy.org.uk/apache/storm/apache-storm-\${STORM_VERSION}/apache-storm-\${STORM_VERSION}.tar.gz ;gunzip apache-storm-\${STORM_VERSION}.tar.gz; tar -xvf apache-storm-\${STORM_VERSION}.tar; mkdir -p \${STORM_HOME}; mv apache-storm-\${STORM_VERSION}/* \${STORM_HOME}; rm apache-storm-\${STORM_VERSION}.tar; rm -fR apache-storm-\${STORM_VERSION}"

echo "RUN apt-get install -y python"

echo "ENV PATH \${PATH}:\${STORM_HOME}/bin"


IFS=$OIFS
