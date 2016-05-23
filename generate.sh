UBUNTU_VERSIONS=(14.04 15.04 15.10)
JDK_VERSIONS=(oracle_jdk7.80.15 oracle_jdk8.66.17i oracle_jdk8.92.14)
STORM_VERSIONS=(0.9.5 0.9.6 0.10.1 1.0.1)


echo ${UBUNTU_VERSIONS[@]}
for UBUNTU_VERSION in "${UBUNTU_VERSIONS[@]}"
   do
   for JDK_VERSION in "${JDK_VERSIONS[@]}"
      do
      for STORM_VERSION in "${STORM_VERSIONS[@]}"
         do
         echo "$STORM_VERSION/$JDK_VERSION/ubuntu$UBUNTU_VERSION" 
         mkdir -p $STORM_VERSION/$JDK_VERSION/ubuntu$UBUNTU_VERSION
         ./Dockerfile.sh $UBUNTU_VERSION $JDK_VERSION $STORM_VERSION > $STORM_VERSION/$JDK_VERSION/ubuntu$UBUNTU_VERSION/Dockerfile
         mkdir -p $STORM_VERSION/$JDK_VERSION/ubuntu$UBUNTU_VERSION/nimbus
         ./nimbus-dockerfile.sh $UBUNTU_VERSION $JDK_VERSION $STORM_VERSION > $STORM_VERSION/$JDK_VERSION/ubuntu$UBUNTU_VERSION/nimbus/Dockerfile

         mkdir -p $STORM_VERSION/$JDK_VERSION/ubuntu$UBUNTU_VERSION/supervisor
         ./supervisor-dockerfile.sh $UBUNTU_VERSION $JDK_VERSION $STORM_VERSION > $STORM_VERSION/$JDK_VERSION/ubuntu$UBUNTU_VERSION/supervisor/Dockerfile

         mkdir -p $STORM_VERSION/$JDK_VERSION/ubuntu$UBUNTU_VERSION/ui
         ./ui-dockerfile.sh $UBUNTU_VERSION $JDK_VERSION $STORM_VERSION > $STORM_VERSION/$JDK_VERSION/ubuntu$UBUNTU_VERSION/ui/Dockerfile
         done
      done 
   done



