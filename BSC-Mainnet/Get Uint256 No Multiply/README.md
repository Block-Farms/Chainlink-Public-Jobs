# Get > Uint256 No Multiply
Smart contract to return a single Uint256 integer from our oracle using a `curl GET` compatible public JSON API.

## Standard Use Cases:
[1] Pricing Information

## Oracle Address & JobID:
[Oracle Address](https://bscscan.com/address/0xEF847C4D7893C4598f234638CebE25B4C9Ea32B3): 
```
0xEF847C4D7893C4598f234638CebE25B4C9Ea32B3
```
Oracle JobID: 
```
3e7d2c788487438082bda8a600037b76
```
Oracle Fee: 0.1 [LINK](https://bscscan.com/token/0x404460c6a5ede2d891e8297795264fde62adbb75)

## Input Variables:
The smart contract requires the following parameters to be specified BEFORE compiling & deploying on Remix:

* Line 36: `"https://YOUR_API_ENDPOINT_URL"` - Update to your API Endpoint

* Line 37: `"data,results"` - comma-separated JSON path used to the positive number wanted to be delivered to the requesting smart contract

Note: Arrays within JSON responses can be accessed with proper syntax such as: `"0,data,results"`

## Example JSON API response & Chainlink Oracle Pathing
If you set the following parameters

* API Endpoint : https://raw.githubusercontent.com/Block-Farms/Chainlink-Public-Jobs/master/example-json/uint256-no-multiply-example.json

Curl command : 
```
curl https://raw.githubusercontent.com/Block-Farms/Chainlink-Public-Jobs/master/example-json/uint256-no-multiply-example.json
```

* JSON Path : `"link,last_updated_at"`

JSON API Output:
```
{
  "link": {
    "usd": 34.87,
    "usd_market_cap": 218338625.82562163,
    "usd_24h_vol": 115678.54293281544,
    "usd_24h_change": 2.5718466631186314,
    "last_updated_at": 1662633735
  }
}
```
This example request, if used with the example smart contract would have returned: `1662633735`

## Deploying the Requesting Smart Contract & Getting your first data delivered:
[1] Go to [Remix.org](https://remix.ethereum.org/)

[2] Login to Metamask, and ensure the network currently used is BSC Mainnet.

[3] Copy & Paste the entire contents of `Get > Uint256 No Multiply.sol` from this directory

[4] Ensure the Input variables mentioned prior are updated to your use-case on lines36-37

[5] Compile & Deploy

[6] Click the orange `requestUnit` button in the smart contract Read/Write functionality

[7] Pay the gas to send the request to our oracle

[8] Wait ~1-2minutes (1-2 blocks) for the requested to be delivered to your requesting smart contract

[9] Click the blue `Uint` button to display the returned value from the oracle

## Troubleshooting: :hammer_and_wrench:
Please see our troubleshooting guide [here](https://github.com/Block-Farms/Chainlink-Public-Jobs/blob/master/README.md#troubleshooting).

## Support: :telephone_receiver:
Please reach out to us in our [Discord](https://discord.gg/PgxRVrDUm7) for further assistance, questions, or pricing information.

## Oracle Job Archive: :scroll:
For most of the common direct requests which our developers have requested, see our entire job template [archive](https://github.com/Block-Farms/Chainlink-Job-Spec-Template-Smart-Contract-Archive/tree/main/2_Direct_Request).
