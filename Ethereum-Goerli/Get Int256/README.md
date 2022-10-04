# Get > Int256
Smart contract to return a single integer from our oracle using a `curl GET` compatible public JSON API.

## Standard Use Cases:
[1] Numerical Data

## Oracle Address & JobID:
[Oracle Address](https://goerli.etherscan.io/token/0x090A0962e36b9BE9dd7f7Bd60Ff8018a23ABD52E): 
```
0x090A0962e36b9BE9dd7f7Bd60Ff8018a23ABD52E
```
Oracle JobID: 
```
e07fd3ed28544479bb1973e9c3379780
```
Oracle Fee: 0.0 [LINK](https://goerli.etherscan.io/token/0x326C977E6efc84E512bB9C30f76E30c160eD06FB)

## Input Variables:
The smart contract requires the following parameters to be specified BEFORE compiling & deploying on Remix:

* Line 33: `"https://YOUR_API_ENDPOINT_URL"` - Update to your API Endpoint

* Line 34: `"data,results"` - comma-separated JSON path used to the positive number wanted to be delivered to the requesting smart contract

Note: Arrays within JSON responses can be accessed with proper syntax such as: `"0,data,results"`

## Example JSON API response & Chainlink Oracle Pathing
If you set the following parameters

* API Endpoint : https://raw.githubusercontent.com/Block-Farms/Chainlink-Public-Jobs/master/example-json/int256-example.json

Curl command : 
```
curl https://raw.githubusercontent.com/Block-Farms/Chainlink-Public-Jobs/master/example-json/int256-example.json
```

* JSON Path : `"link,usd_24h_change"`

* Multiplication factor : 10000000000000000

JSON API Output:
```
{
  "link": {
    "usd": 34.87,
    "usd_market_cap": 218338625.82562163,
    "usd_24h_vol": 115678.54293281544,
    "usd_24h_change": -2.5718466631186314,
    "last_updated_at": 1662633735
  }
}
```

This example request, if used with the example smart contract would have returned: -25718466631186314

Note: Divide by the multiplication factor to get the proper decimal places back for downstream usage after the fulfillRequest

## Deploying the Requesting Smart Contract & Getting your first data delivered:
[1] Go to [Remix.org](https://remix.ethereum.org/)

[2] Login to Metamask, and ensure the network currently used is ETH-Goerli.

[3] Copy & Paste the entire contents of `Get > Int256.sol` from this directory

[4] Ensure the Input variables mentioned prior are updated to your use-case on lines33-34

[5] Compile & Deploy

[6] ~~Send the minimum erc677 LINK for the number of requests to your newly deployed smart contract~~

[6] Click the orange `requestInt` button in the smart contract Read/Write functionality

[7] ~~Pay the gas to send the request to our oracle~~

[8] Wait ~1-2minutes (1-2 blocks) for the requested to be delivered to your requesting smart contract

[9] Click the blue `Int` button to display the returned value from the oracle

## Troubleshooting: :hammer_and_wrench:
Please see our troubleshooting guide [here](https://github.com/Block-Farms/Chainlink-Public-Jobs/blob/master/README.md#troubleshooting).

## Support: :telephone_receiver:
Please reach out to us in our [Discord](https://discord.gg/PgxRVrDUm7) for further assistance, questions, or pricing information.

## Oracle Job Archive: :scroll:
For most of the common direct requests which our developers have requested, see our entire job template [archive](https://github.com/Block-Farms/Chainlink-Job-Spec-Template-Smart-Contract-Archive/tree/main/2_Direct_Request).
