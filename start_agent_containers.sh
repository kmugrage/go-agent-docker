#!/bin/bash

for i in {1..5} 
do 
	docker run -d kmugrage/go-agent
done
