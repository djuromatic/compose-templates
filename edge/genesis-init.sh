#!/bin/bash
set -ex

PUBLIC_IP=$(curl ifconfig.io)
NODE_ID=$(cat ./validator-bootnode/secrets-output.json | jq -r '.[0] | .node_id')
BOOTNODE=/ip4/${PUBLIC_IP}/tcp/1478/p2p/${NODE_ID}
PREMINE=0xae1122329CC1ed0Ab344DB182e36939Bf3AdDAc3:0x1431e0fae6d7217caa0000000
CHAIN_ID=33221

if (! command -v jq &>/dev/null); then
	echo "jq is not installed. Please install jq."
	exit 1
fi

#check if initilized
if [ ! -f ./validator-bootnode/secrets-output.json ]; then
	echo "Please run the setup.sh script first."
	exit 1
fi
if [ ! -f ./genesis.json ]; then
	polygon-edge genesis --ibft-validator-type ecdsa --consensus ibft --ibft-validators-prefix-path validator- --bootnode ${BOOTNODE} --premine ${PREMINE} --chain-id ${CHAIN_ID}
fi
exit 0
