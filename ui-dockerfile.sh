PARAM_UBUNTU_VERSION=$1
PARAM_JDK_VERSION=$2
PARAM_STORM_VERSION=$3

OIFS=$IFS
IFS='.' read -ra JDK_VERSION_ARRAY <<< "$PARAM_JDK_VERSION"

echo "FROM ping2ravi/storm:${PARAM_STORM_VERSION}_${PARAM_JDK_VERSION}_ubuntu.${PARAM_UBUNTU_VERSION}"
echo ""
echo ""

echo "MAINTAINER Ravi Sharma"


echo "# Ubuntu ${PARAM_UBUNTU_VERSION}"
echo "# Java Version ${JDK_VERSION_ARRAY[0]} update ${JDK_VERSION_ARRAY[1]}"
echo "# Storm Version ${PARAM_STORM_VERSION}"
echo "#     http://storm.apache.org/downloads.html"

echo "RUN ln -s /usr/bin/python3.4 /usr/bin/python"
echo "CMD storm ui"

IFS=$OIFS
