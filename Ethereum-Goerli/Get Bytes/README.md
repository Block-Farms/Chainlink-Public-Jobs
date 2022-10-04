# Get > Bytes
Smart contract to return a single Bytes from our oracle using a `curl GET` compatible public JSON API.

## Standard Use Cases:
[1] Pricing Information

## Oracle Address & JobID:
[Oracle Address](https://goerli.etherscan.io/token/0xedaa6962Cf1368a92e244DdC11aaC49c0A0acC37): 
```
0xedaa6962Cf1368a92e244DdC11aaC49c0A0acC37
```
Oracle JobID: 
```
0175983bdaa946f2b59a6d0aaffbde91
```
Oracle Fee: 0.0 [LINK](https://goerli.etherscan.io/token/0x326C977E6efc84E512bB9C30f76E30c160eD06FB)

## Input Variables:
The smart contract requires the following parameters to be specified BEFORE compiling & deploying on Remix:

* Line 32: `"https://YOUR_API_ENDPOINT_URL"` - Update to your API Endpoint

* Line 33: `"data,results"` - comma-separated JSON path used to the positive number wanted to be delivered to the requesting smart contract

Note: Arrays within JSON responses can be accessed with proper syntax such as: `"0,data,results"`

## Example JSON API response & Chainlink Oracle Pathing
If you set the following parameters

* API Endpoint : https://raw.githubusercontent.com/Block-Farms/Chainlink-Public-Jobs/master/example-json/bytes-example.json

Curl command : 
```
curl https://raw.githubusercontent.com/Block-Farms/Chainlink-Public-Jobs/master/example-json/bytes-example.json
```

* JSON Path : `"image"`

JSON API Output:
```
{
  "image": "0x68747470733a2f2f697066732e696f2f697066732f516d5358416257356b716e3259777435444c336857354d736a654b4a4839724c654c6b51733362527579547871313f66696c656e616d653d73756e2d636861696e6c696e6b2e676966"
}
```
This example request, if used with the example smart contract would have returned: `chainlink`

## Deploying the Requesting Smart Contract & Getting your first data delivered:
[1] Go to [Remix.org](https://remix.ethereum.org/)

[2] Login to Metamask, and ensure the network currently used is ETH-Goerli.

[3] Copy & Paste the entire contents of `Get > Bytes.sol` from this directory

[4] Ensure the Input variables mentioned prior are updated to your use-case on lines32-33

[5] Compile & Deploy

[6] ~~Send the minimum erc677 LINK for the number of requests to your newly deployed smart contract~~

[6] Click the orange `requestBytes` button in the smart contract Read/Write functionality

[7] ~~Pay the gas to send the request to our oracle~~

[8] Wait ~1-2minutes (1-2 blocks) for the requested to be delivered to your requesting smart contract

[9] Click the blue `data` button to display the returned value from the oracle

## Troubleshooting: :hammer_and_wrench:
Please see our troubleshooting guide [here](https://github.com/Block-Farms/Chainlink-Public-Jobs/blob/master/README.md#troubleshooting).

## Support: :telephone_receiver:
Please reach out to us in our [Discord](https://discord.gg/PgxRVrDUm7) for further assistance, questions, or pricing information.

## Oracle Job Archive: :scroll:
For most of the common direct requests which our developers have requested, see our entire job template [archive](https://github.com/Block-Farms/Chainlink-Job-Spec-Template-Smart-Contract-Archive/tree/main/2_Direct_Request).
