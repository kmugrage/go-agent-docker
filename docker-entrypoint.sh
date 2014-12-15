#!/bin/bash
set -e

if [ -z "$GO_SERVER" ]; then
    GO_SERVER=127.0.0.1
fi
if [ -z "$GO_SERVER_PORT" ]; then
    GO_SERVER_PORT=8153
fi

echo "
GO_SERVER=$GO_SERVER
export GO_SERVER
GO_SERVER_PORT=$GO_SERVER_PORT
export GO_SERVER_PORT
" >> /etc/default/go-agent

if [ -z "$GO_AUTOREGISTER_KEY" ]; then
    echo "
agent.auto.register.key=$GO_AUTOREGISTER_KEY
agent.auto.register.resources=$GO_AUTOREGISTER_RESOURCES
" > /var/lib/go-agent/config/autoregister.properties
fi

# execute the actual command of the image
# for example, this is likely "foreman start"
# THIS MUST BE THE LAST LINE OF THIS FILE
exec "$@"
