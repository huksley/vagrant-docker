#!/bin/bash

if [ -d /vagrant/deb ]; then
	# Install from cache
	dpkg -G -E -i /vagrant/deb/*.deb
else 
	curl -fsSL https://apt.dockerproject.org/gpg | apt-key add -

	add-apt-repository \
       "deb https://apt.dockerproject.org/repo/ \
       ubuntu-$(lsb_release -cs) \
       main"

	apt-get update
	apt-get upgrade -y

	apt-get install -y --no-install-recommends \
    	linux-image-extra-$(uname -r) \
    	linux-image-extra-virtual \
		curl wget mc docker-engine

	docker run hello-world
	#groupadd docker

	mkdir -p /vagrant/deb
	rm -Rf /vagrant/deb/*.deb
	cp /var/cache/apt/archives/*.deb /vagrant/deb/
fi

usermod -aG docker vagrant

if [ ! -f /vagrant/docker-compose ]; then
	curl -L "https://github.com/docker/compose/releases/download/1.10.0/docker-compose-$(uname -s)-$(uname -m)" -o /vagrant/docker-compose
fi


cp /vagrant/docker-compose /usr/local/bin
chmod +x /usr/local/bin/docker-compose
