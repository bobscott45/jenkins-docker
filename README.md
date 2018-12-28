# jenkins-docker

Docker image created from jenkins/jenkins:lts [(available at Docker Hub)](https://hub.docker.com/r/jenkins/jenkins) with docker client added to use the docker server on the host from docker client in the jenkins container.

## Prerequisites

Docker must be installed on the host machine:-
```
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
```


## Usage

Create a docker volume:-

```
docker volume create jenkins_home
```

Create a container using the above volume and the host docker server:-

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
docker run  -d  -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock -e DOCKER_GROUP_ID=997 -e DOCKER_ARCH=armhf -e DOCKER_VERSION=18.06.1-ce --name=jenkins bobscott45/jenkins-docker:lts

```

The container docker group id must match the host which can be done with:-

```
docker run  -d  -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock -e DOCKER_GROUP_ID=`cut -d: -f3 < <(getent group docker)` --name=jenkins bobscott45/jenkins-docker:lts

```

See `https://github.com/jenkinsci/docker/blob/master/README.md` for documentation on running jenkins.


## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

See <https://jenkins.io/> and <https://www.docker.com/> for Jenkins and Docker CE licence details.

