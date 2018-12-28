# jenkins-docker

Docker image jenkins/jenkins:lts [available at Docker Hub](https://hub.docker.com/r/jenkins/jenkins) with docker client added.

## Prerequisites

Docker must be installed on the host machine.
```
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
```


## Usage

To use the docker daemon on the host with a docker volume:-

```
docker volume create jenkins_home
```

```
docker run  -d  -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock bobscott45/jenkins-docker:lts
```

The first time a container is run from this image, docker will be installed in the container. The following environment variables control which version of docker is installed:-

  * DOCKER_ARCH=x86_64
  * DOCKER_VERSION=18.09.0

See <https://docs.docker.com/install/linux/docker-ce/binaries/> for details on installing docker from binaries.

The container docker group id can be set with the following environment variable on first run:-

  * DOCKER_GROUP_ID=999

An example using all the environment variables:-

```
docker run  -d  -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock -e DOCKER_GROUP_ID=997 -e DOCKER_ARCH=armhf -e DOCKER_VERSION=18.06.1-ce --name=jenkins jenkins-docker:lts

```

The container docker group id must match the host which can be done with:-

```
docker run  -d  -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock -e DOCKER_GROUP_ID=`cut -d: -f3 < <(getent group docker)` --name=jenkins jenkins-docker:lts

```





See `https://github.com/jenkinsci/docker/blob/master/README.md` for documentation on running jenkins.

## Prerequisites

Docker must be installed on the host machine.
```
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
```

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

