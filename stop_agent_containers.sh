#!/bin/bash


#Stop and rm the containers. I don't need to know if it fails
#because I want them gone. If they aren't there it will just be
#faster


stop_containers()
{
	docker stop `docker ps --no-trunc -a -q` 2>/dev/null
	return 1
}

rm_containers()
{
	docker rm `docker ps --no-trunc -a -q` 2>/dev/null
	return 1
}

stop_containers
rm_containers

echo "done"
