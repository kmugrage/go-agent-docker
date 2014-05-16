Go Agent Docker
===============

Creating Go CD agents from a dockerfile. 

This is really mostly a spike at this point. I wanted a way to run multiple agents in
discrete containers on my machine. The files should work for anyone else if you edit
go-agent and autoregister.properties

## Usage

git clone this repo

<code>
docker build -t your-repo-name/go-agent .
</code>
<code>
docker run -d your-repo-name/go-agent
</code>
