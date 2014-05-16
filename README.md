Go Agent Docker
===============

Creating Go CD agents from a dockerfile. 

This is really mostly a spike at this point. I wanted a way to run multiple agents in
discrete containers on my machine. The files should work for anyone else if you edit
go-agent and autoregister.properties

## Usage

git clone this repo

Build your image
<code>
docker build -t your-repo-name/go-agent .
</code>

This will launch 10 agents in containers
<code>
for i in {1..10} ; do docker run -d kmugrage/go-agent ; done
</code>

## ToDo

I don't have a good way to clean this all up yet. Probably need some sort of script
that will stop / rm all of the containers and then use the Go API to delete them from 
there as well. 
