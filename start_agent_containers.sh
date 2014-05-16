#!/bin/bash

for i in {1..3} 
do 
	docker run -d kmugrage/go-agent
done
