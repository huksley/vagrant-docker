#!/bin/bash

if [ ! -f /vagrant/.updated ]; then
	apt-get update
	apt-get upgrade -y
	touch /vagrant/.updated
fi

apt-get install -y --no-install-recommends \
    linux-image-extra-$(uname -r) \
    linux-image-extra-virtual \
	curl wget mc

curl -fsSL https://apt.dockerproject.org/gpg | apt-key add -

add-apt-repository \
       "deb https://apt.dockerproject.org/repo/ \
       ubuntu-$(lsb_release -cs) \
       main"

apt-get update
apt-get -y install docker-engine
docker run hello-world
#groupadd docker
usermod -aG docker vagrant
curl -L "https://github.com/docker/compose/releases/download/1.10.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose


