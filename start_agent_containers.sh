#!/bin/bash

for i in {1..$1} 
do 
	docker run -d gocd/go-agent
done
