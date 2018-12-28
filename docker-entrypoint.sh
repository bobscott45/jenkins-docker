CONTAINER_ALREADY_STARTED="CONTAINER_ALREADY_STARTED_PLACEHOLDER"
if [ ! -e $CONTAINER_ALREADY_STARTED ]; then
    touch $CONTAINER_ALREADY_STARTED
    echo "-- docker group id = $1 --"
    groupadd -g $1 docker
    usermod -aG docker jenkins
else
    echo "-- Not first container startup --"
fi
su - jenkins
/sbin/tini -- /usr/local/bin/jenkins.sh
