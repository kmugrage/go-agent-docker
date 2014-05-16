#!/bin/bash

docker stop `docker ps --no-trunc -a -q`
docker rm `docker ps --no-trunc -a -q`
