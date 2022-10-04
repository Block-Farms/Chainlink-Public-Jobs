# Get > Address
Smart contract to return Address values from our oracle using a `curl GET` compatible public JSON API.

## Standard Use Cases:
[1] Address Return

## Oracle Address & JobID:
[Oracle Address](https://ftmscan.com/address/0x41fC087cd79fC67f6234B721f8A8AdE68d8aeB8E): 
```
0x41fC087cd79fC67f6234B721f8A8AdE68d8aeB8E
```
Oracle JobID: 
```
b91fd273ac784d6e96d6e7f5ad6f441c
```
Oracle Fee: 0.15 [LINK](https://ftmscan.com/token/0x6F43FF82CCA38001B6699a8AC47A2d0E66939407)

NOTE: Chainlink oracles operating on Fantom Mainnet, must be paid in the ERC-677 LINK token, not the ERC20-20 LINK token. You must use ERC-677 LINK on Fantom. ERC-20 LINK will not work with Chainlink services. Use [bridge.multichain.org](https://bridge.multichain.org/#/router) to send LINK to the Fantom network, be sure to select LINK-ERC677 as the token you will receive on Fantom mainnet.

## Input Variables:
The smart contract requires the following parameters to be specified BEFORE compiling & deploying on Remix:

* Line 30: `"https://YOUR_API_ENDPOINT_URL"` - Update to your API Endpoint

* Line 31: `"data,results"` - comma-separated JSON path used to the positive number wanted to be delivered to the requesting smart contract

Note: Arrays within JSON responses can be accessed with proper syntax such as: `"0,data,results"`

## Example JSON API response & Chainlink Oracle Pathing
If you set the following parameters

* API Endpoint : https://raw.githubusercontent.com/Block-Farms/Chainlink-Public-Jobs/master/example-json/address-example.json

Curl command : 
```
curl https://raw.githubusercontent.com/Block-Farms/Chainlink-Public-Jobs/master/example-json/address-example.json
```

* JSON Path : `"data"`

JSON API Output:
```
{
  "data": 0xde0b295669a9fd93d5f28d9ec85e40f4cb697bae
}
```
## Deploying the Requesting Smart Contract & Getting your first data delivered:
[1] Go to [Remix.org](https://remix.ethereum.org/)

[2] Login to Metamask, and ensure the network currently used is fantom Mainnet.

[3] Copy & Paste the entire contents of `Get > Address.sol` from this directory

[4] Ensure the Input variables mentioned prior are updated to your use-case on lines30-31

[5] Compile & Deploy

[6] Send the minimum erc677 LINK for the number of requests to your newly deployed smart contract

[6] Click the orange `requestAddress` button in the smart contract Read/Write functionality

[7] Pay the gas to send the request to our oracle

[8] Wait ~1-2minutes (1-2 blocks) for the requested to be delivered to your requesting smart contract

[9] Click the blue `AddressVariable` button to display the returned value from the oracle

## Troubleshooting: :hammer_and_wrench:
Please see our troubleshooting guide [here](https://github.com/Block-Farms/Chainlink-Public-Jobs/blob/master/README.md#troubleshooting).

## Support: :telephone_receiver:
Please reach out to us in our [Discord](https://discord.gg/PgxRVrDUm7) for further assistance, questions, or pricing information.

## Oracle Job Archive: :scroll:
For most of the common direct requests which our developers have requested, see our entire job template [archive](https://github.com/Block-Farms/Chainlink-Job-Spec-Template-Smart-Contract-Archive/tree/main/2_Direct_Request).
