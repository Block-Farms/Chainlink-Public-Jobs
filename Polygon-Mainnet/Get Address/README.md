# Get > Address
Smart contract to return Address values from our oracle using a `curl GET` compatible public JSON API.

## Standard Use Cases:
[1] Address Return

## Oracle Address & JobID:
[Oracle Address](https://polygonscan.com/address/0x14fB588AD6DA21d7F790D477354DE923AE5BeB07): 
```
0x14fB588AD6DA21d7F790D477354DE923AE5BeB07
```
Oracle JobID: 
```
b91fd273ac784d6e96d6e7f5ad6f441c
```
Oracle Fee: 0.15 [LINK](https://polygonscan.com/address/0xb0897686c545045afc77cf20ec7a532e3120e0f1)

NOTE: Chainlink oracles operating on Polygon Mainnet, must be paid in the erc677 LINK token, not the erc20 LINK token. To swap between the two LINK tokens: use the official Chainlink Platform: [Pegswap](https://pegswap.chain.link/)

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

[2] Login to Metamask, and ensure the network currently used is Polygon Mainnet.

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
