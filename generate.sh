UBUNTU_VERSIONS=(15.10 16.04)
ALPINE_VERSIONS=(3.4 3.8)
JDK_VERSIONS=(oracle_jdk8.131.11)
STORM_VERSIONS=(1.2.2)


echo ${UBUNTU_VERSIONS[@]}
for UBUNTU_VERSION in "${UBUNTU_VERSIONS[@]}"
   do
   for JDK_VERSION in "${JDK_VERSIONS[@]}"
      do
      for STORM_VERSION in "${STORM_VERSIONS[@]}"
         do
         echo "$STORM_VERSION/$JDK_VERSION/ubuntu$UBUNTU_VERSION" 
         mkdir -p $STORM_VERSION/$JDK_VERSION/ubuntu$UBUNTU_VERSION
         cp start-storm-cluster.sh $STORM_VERSION/$JDK_VERSION/ubuntu$UBUNTU_VERSION/.
         ./Dockerfile.sh $UBUNTU_VERSION $JDK_VERSION $STORM_VERSION ubuntu > $STORM_VERSION/$JDK_VERSION/ubuntu$UBUNTU_VERSION/Dockerfile
         mkdir -p $STORM_VERSION/$JDK_VERSION/ubuntu$UBUNTU_VERSION/nimbus
         ./nimbus-dockerfile.sh $UBUNTU_VERSION $JDK_VERSION $STORM_VERSION > $STORM_VERSION/$JDK_VERSION/ubuntu$UBUNTU_VERSION/nimbus/Dockerfile

         mkdir -p $STORM_VERSION/$JDK_VERSION/ubuntu$UBUNTU_VERSION/supervisor
         ./supervisor-dockerfile.sh $UBUNTU_VERSION $JDK_VERSION $STORM_VERSION > $STORM_VERSION/$JDK_VERSION/ubuntu$UBUNTU_VERSION/supervisor/Dockerfile

         mkdir -p $STORM_VERSION/$JDK_VERSION/ubuntu$UBUNTU_VERSION/ui
         ./ui-dockerfile.sh $UBUNTU_VERSION $JDK_VERSION $STORM_VERSION > $STORM_VERSION/$JDK_VERSION/ubuntu$UBUNTU_VERSION/ui/Dockerfile
         done
      done 
   done

JDK_VERSIONS=(oracle_jdk8.181.13 oracle_jdk10.0.2)

echo ${ALPINE_VERSIONS[@]}
for ALPINE_VERSION in "${ALPINE_VERSIONS[@]}"
   do
   for JDK_VERSION in "${JDK_VERSIONS[@]}"
      do
      for STORM_VERSION in "${STORM_VERSIONS[@]}"
         do
         echo "$STORM_VERSION/$JDK_VERSION/alpine$ALPINE_VERSION"
         mkdir -p $STORM_VERSION/$JDK_VERSION/alpine$ALPINE_VERSION
         cp start-storm-cluster.sh $STORM_VERSION/$JDK_VERSION/alpine$ALPINE_VERSION/.
         ./Dockerfile.sh $ALPINE_VERSION $JDK_VERSION $STORM_VERSION alpine > $STORM_VERSION/$JDK_VERSION/alpine$ALPINE_VERSION/Dockerfile
         mkdir -p $STORM_VERSION/$JDK_VERSION/alpine$ALPINE_VERSION/nimbus
         ./nimbus-dockerfile.sh $ALPINE_VERSION $JDK_VERSION $STORM_VERSION > $STORM_VERSION/$JDK_VERSION/alpine$ALPINE_VERSION/nimbus/Dockerfile

         mkdir -p $STORM_VERSION/$JDK_VERSION/alpine$ALPINE_VERSION/supervisor
         ./supervisor-dockerfile.sh $ALPINE_VERSION $JDK_VERSION $STORM_VERSION > $STORM_VERSION/$JDK_VERSION/alpine$ALPINE_VERSION/supervisor/Dockerfile

         mkdir -p $STORM_VERSION/$JDK_VERSION/alpine$ALPINE_VERSION/ui
         ./ui-dockerfile.sh $ALPINE_VERSION $JDK_VERSION $STORM_VERSION > $STORM_VERSION/$JDK_VERSION/alpine$ALPINE_VERSION/ui/Dockerfile
         done
      done
   done


