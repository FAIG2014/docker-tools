#!/bin/bash
set -e


DOCKER_WORKSPACE=${DOCKER_WORKSPACE:=${HOME}/workspace}

if [ -z "${DOCKER_NAME}" ];
then
    NAME_OPTION="";
else
    NAME_OPTION="--name ${DOCKER_NAME}";
fi


HERE=$(cd `dirname "${BASH_SOURCE[0]}"` && pwd)
RANDOM_ID=$(${HERE}/generate-random-string.sh 5)
CONTAINER_ID_FILE=/tmp/docker-container-id.${RANDOM_ID}

set +e
docker run \
    -it \
    --rm \
    --cidfile=${CONTAINER_ID_FILE} \
    -u $(id -u) \
    -w ${PWD} \
    -v ${DOCKER_WORKSPACE}:${DOCKER_WORKSPACE} \
    -e XAUTHORITY=:${HOME}/.Xauthority \
    -e DISPLAY=$DISPLAY \
    -v /tmp:/tmp \
    -v /etc/passwd:/etc/passwd:ro \
    -v /etc/group:/etc/group:ro \
    --net=host \
    ${NAME_OPTION} \
    $@

EXIT_CODE=$?
CONTAINER_ID=$(cat ${CONTAINER_ID_FILE})
rm ${CONTAINER_ID_FILE}

exit ${EXIT_CODE}

