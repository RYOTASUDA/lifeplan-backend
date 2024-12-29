DOCKER_NETWORK=`docker network ls | grep $NETWORK_NAME -o`

if [ "$DOCKER_NETWORK" != "$NETWORK_NAME" ]; then
  echo `docker network create lifeplan-network`
fi
