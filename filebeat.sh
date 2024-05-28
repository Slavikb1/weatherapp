#!/bin/bash

docker run -d -p 80:5000 --volume /home/ec2-user/logs:/home/ec2-user/logs --restart unless-stopped slavikb/weatherapp:latest

docker run -d --name=filebeat   --user=root   --volume="$(pwd)/filebeat.yml:/usr/share/filebeat/filebeat.yml:ro" \
	--volume="/var/lib/docker/containers:/var/lib/docker/containers:ro"  \
	--volume="/var/run/docker.sock:/var/run/docker.sock:ro" \
	--volume="/home/ec2-user/logs:/home/ec2-user/logs"\
	docker.elastic.co/beats/filebeat:8.13.0
