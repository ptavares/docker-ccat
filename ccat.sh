#!/bin/bash
CCAT_VERSION=1.1.0
DOCKER_IMAGE=tavarespatrick/docker-ccat:${CCAT_VERSION}

if [ $# -lt 1 ];
then
    echo "illegal number of parameters"
    echo "usage : $0 path_to_file"
    exit 1
fi

for var in "$@"
do
    echo
    echo "============ $var ==========="
    echo
    path=${var%/*}
    base=${var##*/}
    if [ ${path} == ${base} ]
    then
        docker run -ti --rm -v $(pwd)/:/ccat ${DOCKER_IMAGE} $var
    else
        docker run -ti --rm -v $(pwd)/${path}:/ccat ${DOCKER_IMAGE} ${base}
    fi
    echo
done

