#!/bin/bash
CCAT_VERSION=1.10


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
        docker run -ti --rm -v $(pwd)/:/ccat alpine/ccat:${CCAT_VERSION} $var
    else
        docker run -ti --rm -v $(pwd)/${path}:/ccat alpine/ccat:${CCAT_VERSION} ${base}
    fi
    echo
done

