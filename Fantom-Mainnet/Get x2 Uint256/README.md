# Get > x2 Uint256
Smart contract to return Uint256 integer from our oracle using a `curl GET` compatible public JSON API.

## Standard Use Cases:
[1] Pricing Information

## Oracle Address & JobID:
[Oracle Address](https://ftmscan.com/address/0x41fC087cd79fC67f6234B721f8A8AdE68d8aeB8E): 
```
0x41fC087cd79fC67f6234B721f8A8AdE68d8aeB8E
```
Oracle JobID: 
```
d3439590d6b047a38f1cd984154b1c0e
```
Oracle Fee: 0.15 [LINK](https://ftmscan.com/token/0x6F43FF82CCA38001B6699a8AC47A2d0E66939407)

NOTE: Chainlink oracles operating on Fantom Mainnet, must be paid in the ERC-677 LINK token, not the ERC20-20 LINK token. You must use ERC-677 LINK on Fantom. ERC-20 LINK will not work with Chainlink services. Use [bridge.multichain.org](https://bridge.multichain.org/#/router) to send LINK to the Fantom network, be sure to select LINK-ERC677 as the token you will receive on Fantom mainnet.

## Input Variables:
The smart contract requires the following parameters to be specified BEFORE compiling & deploying on Remix:

* Line 31: `"https://YOUR_API_ENDPOINT_URL"` - Update to your API Endpoint

* Line 32: `"data,results"` - comma-separated JSON path used to the positive number wanted to be delivered to the requesting smart contract

Note: Arrays within JSON responses can be accessed with proper syntax such as: `"0,data,results"`

* Line 33: `100` - multiplication factor must be used to multiply all the decimal places present within the API JSON response:

Ex: 123.456, use multiplication factor of 1000 for your smart contract to receive all 6 significant digits (123456).

## Example JSON API response & Chainlink Oracle Pathing
If you set the following parameters

* API Endpoint : https://raw.githubusercontent.com/Block-Farms/Chainlink-Public-Jobs/master/example-json/x2-uint256-example.json

Curl command : 
```
curl https://raw.githubusercontent.com/Block-Farms/Chainlink-Public-Jobs/master/example-json/x2-uint256-example.json
```

* JSON Path1 : `"linkusd-24hr-low"`

* JSON Path2 : `"linkusd-24hr-high"`

* Multiplication factor : 100

JSON API Output:
```
{
  "linkusd-24hr-low": 34.87,
  "linkusd-24hr-high": 37.12
}
```
This example request, if used with the example smart contract would have returned: `3487,3712`

Note: Divide by the multiplication factor to get the proper decimal places back for downstream usage after the `fulfillRequest`

## Deploying the Requesting Smart Contract & Getting your first data delivered:
[1] Go to [Remix.org](https://remix.ethereum.org/)

[2] Login to Metamask, and ensure the network currently used is fantom Mainnet.

[3] Copy & Paste the entire contents of `Get > x2 Uint256.sol` from this directory

[4] Ensure the Input variables mentioned prior are updated to your use-case on lines31-33

[5] Compile & Deploy

[6] Send the minimum erc677 LINK for the number of requests to your newly deployed smart contract

[6] Click the orange `requestValue1AndValue2` button in the smart contract Read/Write functionality

[7] Pay the gas to send the request to our oracle

[8] Wait ~1-2minutes (1-2 blocks) for the requested to be delivered to your requesting smart contract

[9] Click the blue `Value` button and `Value2` button to display the returned value from the oracle

## Troubleshooting: :hammer_and_wrench:
Please see our troubleshooting guide [here](https://github.com/Block-Farms/Chainlink-Public-Jobs/blob/master/README.md#troubleshooting).

## Support: :telephone_receiver:
Please reach out to us in our [Discord](https://discord.gg/PgxRVrDUm7) for further assistance, questions, or pricing information.

## Oracle Job Archive: :scroll:
For most of the common direct requests which our developers have requested, see our entire job template [archive](https://github.com/Block-Farms/Chainlink-Job-Spec-Template-Smart-Contract-Archive/tree/main/2_Direct_Request).
