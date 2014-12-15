Go Agent Docker
===============

Creating Go CD agents from a Dockerfile.

## Usage

```
docker build -t gocd/agent .
docker run -e "GO_SERVER=your_host" -e "GO_SERVER_PORT=8153" gocd/agent
```

## Autoregister

If you want to autoregister, just pass the following environment variables.

```
GO_AUTOREGISTER_KEY - the autoregistration key so that your agents are immediately available
GO_AUTOREGISTER_RESOURCES - [optional] resources to register for your new agent
```
