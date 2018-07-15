# docker-ccat

[![Docker Automated build](https://img.shields.io/docker/automated/jrottenberg/ffmpeg.svg)](https://hub.docker.com/r/tavarespatrick/ccat/)

[![](https://dockerbuildbadges.quelltext.eu/status.svg?organization=tavarespatrick&repository=ccat)](https://hub.docker.com/r/tavarespatrick/ccat/builds/)

## Information

The base docker image :

  * [alpine:latest](https://hub.docker.com/r/_/alpine/)

The GitHub project :

  * [ptavares/docker-ccat](https://github.com/ptavares/docker-ccat)


What are installed in this container :

  * wget
  * [ccat 1.1.0](https://github.com/jingweno/ccat/tree/v1.1.0)


## Installation

You can clone this project and build with docker command :

```
git clone https://github.com/ptavares/docker-ccat.git
cd docker-ccat
docker build -t tavarespatrick/ccat .
```

You can build directly from the [GitHub project](https://github.com/ptavares/docker-ccat/) :

```
docker build -t tavarespatrick/ccat github.com/ptavares/docker-ccat.git
```


## Usage

### From command line :

```
export CCAT_VERSION=latest
export DOCKER_IMAGE=tavarespatrick/docker-ccat:${CCAT_VERSION}
docker run -ti --rm -v $(pwd)/:/ccat ${DOCKER_IMAGE} FILES_TO_CAT_IN_CURRENT_DIRECTORY
```

Exemple :
```
docker run -ti --rm -v $(pwd)/:/ccat tavarespatrick/docker-ccat Dockerfile
```

### From script

Also present in repository, a simple bash script, named [ccat.sh](https://github.com/ptavares/docker-ccat/blob/master/ccat.sh) to wrap command line.
This wrapper alows you to ccat file in another direcroty than the current one.

```
./ccat.sh Dockerfile ../example.txt
```

### Alias

To easily use this command line tool, just add an alias command

```
alias ccat='export CCAT_VERSION=latest; export DOCKER_IMAGE=tavarespatrick/docker-ccat:${CCAT_VERSION}; docker run -ti --rm -v $(pwd)/:/ccat ${DOCKER_IMAGE}'
```
Or alias to [ccat.sh](https://github.com/ptavares/docker-ccat/blob/master/ccat.sh)
```
alias ccat='$HOME/docker-ccat/ccat.sh'

