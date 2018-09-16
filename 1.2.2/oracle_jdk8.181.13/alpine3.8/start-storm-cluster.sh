${ZOOKEEPER_HOME}/bin/zkServer.sh start

nohup ${STORM_HOME}/bin/storm nimbus &
nohup ${STORM_HOME}/bin/storm supervisor &
nohup ${STORM_HOME}/bin/storm ui &
nohup ${STORM_HOME}/bin/storm logviewer &
tail -f /dev/null
