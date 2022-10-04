# Get > Uint256
Smart contract to return a single Uint256 integer from our oracle using a `curl GET` compatible public JSON API.

## Standard Use Cases:
[1] Pricing Information

## Oracle Address & JobID:
[Oracle Address](https://arbiscan.io/address/0x41fC087cd79fC67f6234B721f8A8AdE68d8aeB8E): 
```
0x41fC087cd79fC67f6234B721f8A8AdE68d8aeB8E
```
Oracle JobID: 
```
a052732022e04e89be3e0fc06e457985
```
Oracle Fee: 0.1 [LINK](https://arbiscan.io/address/0xf97f4df75117a78c1A5a0DBb814Af92458539FB4)

NOTE: Chainlink oracles operating on Arbitrum Mainnet, must be paid in the erc677 LINK token, not the erc20 LINK token. To swap between the two LINK tokens: use the official Chainlink Platform: [Pegswap](https://pegswap.chain.link/)

## Input Variables:
The smart contract requires the following parameters to be specified BEFORE compiling & deploying on Remix:

* Line 33: `"https://YOUR_API_ENDPOINT_URL"` - Update to your API Endpoint

* Line 34: `"data,results"` - comma-separated JSON path used to the positive number wanted to be delivered to the requesting smart contract

Note: Arrays within JSON responses can be accessed with proper syntax such as: `"0,data,results"`

* Line 35: `100` - multiplication factor must be used to multiply all the decimal places present within the API JSON response:

Ex: 123.456, use multiplication factor of 1000 for your smart contract to receive all 6 significant digits (123456).

## Example JSON API response & Chainlink Oracle Pathing
If you set the following parameters

* API Endpoint : https://raw.githubusercontent.com/Block-Farms/Chainlink-Public-Jobs/master/example-json/uint256-example.json

Curl command : 
```
curl https://raw.githubusercontent.com/Block-Farms/Chainlink-Public-Jobs/master/example-json/uint256-example.json
```

* JSON Path : `"chainlink,usd"`

* Multiplication factor : 100

JSON API Output:
```
{
  "chainlink": {
    "usd": 7.18
  }
}
```
This example request, if used with the example smart contract would have returned: `718`

Note: Divide by the multiplication factor to get the proper decimal places back for downstream usage after the `fulfillRequest`

## Deploying the Requesting Smart Contract & Getting your first data delivered:
[1] Go to [Remix.org](https://remix.ethereum.org/)

[2] Login to Metamask, and ensure the network currently used is Arbitrum Mainnet.

[3] Copy & Paste the entire contents of `Get > Uint256.sol` from this directory

[4] Ensure the Input variables mentioned prior are updated to your use-case on lines34-34

[5] Compile & Deploy

[6] Send the minimum erc677 LINK for the number of requests to your newly deployed smart contract

[6] Click the orange `fulfillValue` button in the smart contract Read/Write functionality

[7] Pay the gas to send the request to our oracle

[8] Wait ~1-2minutes (1-2 blocks) for the requested Uint256 to be delivered to your requesting smart contract

[9] Click the blue `Uint` button to display the returned Uint256 value from the oracle

## Troubleshooting: :hammer_and_wrench:
Please see our troubleshooting guide [here](https://github.com/Block-Farms/Chainlink-Public-Jobs/blob/master/README.md#troubleshooting).

## Support: :telephone_receiver:
Please reach out to us in our [Discord](https://discord.gg/PgxRVrDUm7) for further assistance, questions, or pricing information.

## Oracle Job Archive: :scroll:
For most of the common direct requests which our developers have requested, see our entire job template [archive](https://github.com/Block-Farms/Chainlink-Job-Spec-Template-Smart-Contract-Archive/tree/main/2_Direct_Request).
