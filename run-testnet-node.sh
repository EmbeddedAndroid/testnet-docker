#!/bin/bash
docker pull ipsumnetwork/ipsd:testnet
docker exec -it ipsd-testnet /ips/src/ips-cli stop
sleep 2
docker stop ipsd-testnet
docker rm ipsd-testnet
docker run -dit --name ipsd-testnet --net=host --restart=always -v /root/blockchains/ips-testnet:/root/.ips ipsumnetwork/ipsd:testnet
docker logs -f ipsd-testnet
