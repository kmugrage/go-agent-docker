#!/bin/bash

for i in $(eval echo {1..$1})
do 
	docker run -d gocd/go-agent
done
