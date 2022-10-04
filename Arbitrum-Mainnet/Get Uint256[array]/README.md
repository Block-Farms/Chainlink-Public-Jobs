# Get > Uint256[array]
Smart contract to return a single Uint256 integer array from our oracle using a `curl GET` compatible public JSON API.

## Standard Use Cases:
[1] Pricing Information

## Oracle Address & JobID:
[Oracle Address](https://arbiscan.io/address/0xc2566feCE70C46085FD50013dDd2408311dE99D4): 
```
0xc2566feCE70C46085FD50013dDd2408311dE99D4
```
Oracle JobID: 
```
90ec64e83b32429b958deb238a23eeed
```
Oracle Fee: 0.15 [LINK](https://arbiscan.io/address/0xf97f4df75117a78c1A5a0DBb814Af92458539FB4)

NOTE: Chainlink oracles operating on Arbitrum Mainnet, must be paid in the ERC20 LINK token. To swap between Ethereum and Arbitrum networks: use the [Arbitrum Bridge](https://bridge.arbitrum.io/).

## Input Variables:
The smart contract requires the following parameters to be specified BEFORE compiling & deploying on Remix:

* Line 30: `"https://YOUR_API_ENDPOINT_URL"` - Update to your API Endpoint

* Line 31: `"data,results"` - comma-separated JSON path used to the positive number wanted to be delivered to the requesting smart contract

Note: Arrays within JSON responses can be accessed with proper syntax such as: `"0,data,results"`

## Example JSON API response & Chainlink Oracle Pathing
If you set the following parameters

* API Endpoint : https://raw.githubusercontent.com/Block-Farms/Chainlink-Public-Jobs/master/example-json/uint256%5Barray%5D-example.json

Curl command : 
```
curl https://raw.githubusercontent.com/Block-Farms/Chainlink-Public-Jobs/master/example-json/uint256%5Barray%5D-example.json
```

* JSON Path : `"data,0"`

JSON API Output:
```
{
  "data": [
    1,
    2,
    3,
    4,
    5
  ]
}
```
This example request, if used with the example smart contract would have returned: `[1,2,3,4,5]`

## Deploying the Requesting Smart Contract & Getting your first data delivered:
[1] Go to [Remix.org](https://remix.ethereum.org/)

[2] Login to Metamask, and ensure the network currently used is Arbitrum Mainnet.

[3] Copy & Paste the entire contents of `Get > Uint256[array].sol` from this directory

[4] Ensure the Input variables mentioned prior are updated to your use-case on lines30-31

[5] Compile & Deploy

[6] Send the minimum erc677 LINK for the number of requests to your newly deployed smart contract

[6] Click the orange `requestArray` button in the smart contract Read/Write functionality

[7] Pay the gas to send the request to our oracle

[8] Wait ~1-2minutes (1-2 blocks) for the requested to be delivered to your requesting smart contract

[9] Click the blue `array` button to display the returned value from the oracle

## Troubleshooting: :hammer_and_wrench:
Please see our troubleshooting guide [here](https://github.com/Block-Farms/Chainlink-Public-Jobs/blob/master/README.md#troubleshooting).

## Support: :telephone_receiver:
Please reach out to us in our [Discord](https://discord.gg/PgxRVrDUm7) for further assistance, questions, or pricing information.

## Oracle Job Archive: :scroll:
For most of the common direct requests which our developers have requested, see our entire job template [archive](https://github.com/Block-Farms/Chainlink-Job-Spec-Template-Smart-Contract-Archive/tree/main/2_Direct_Request).
