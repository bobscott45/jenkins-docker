FROM jenkins/jenkins:lts

USER root

ENV DOCKER_GROUP_ID=999
ENV DOCKER_ARCH=x86_64
ENV DOCKER_VERSION=18.09.0

COPY --chown=root:root ./docker-entrypoint.sh /
RUN mkdir -p /tmp/download && \
  curl -L https://download.docker.com/linux/static/stable/$DOCKER_ARCH/docker-$DOCKER_VERSION.tgz | \
    tar -xz -C /tmp/download && \
  rm -rf /tmp/download/docker/dockerd && \
  mv /tmp/download/docker/docker* /usr/local/bin && \
  rm -rf /tmp/download 

ENTRYPOINT /docker-entrypoint.sh $DOCKER_GROUP_ID


