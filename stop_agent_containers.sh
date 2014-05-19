#!/bin/bash

docker ps --no-trunc -a -q
retval=$?

# echo $retval

if [ $retval -ne 0 ]; then
	docker stop `docker ps --no-trunc -a -q`
	docker rm `docker ps --no-trunc -a -q`
    echo "Return code was not zero but $retval"
fi


