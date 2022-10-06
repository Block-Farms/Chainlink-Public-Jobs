# Chainlink Public Jobs

## Supported Networks :globe_with_meridians:

|    Network    | Testnet/Mainnet |  Status  |    Whitelisting Required   |
| ------------- |  -------------  | --------------------- | ----------- |
|   Ethereum    |     Mainnet     | :heavy_check_mark: | :heavy_check_mark: |
|   Ethereum    |     Goerli      | :heavy_check_mark: | :x: |
|   Polygon     |     Mainnet     | :heavy_check_mark: | :x: |
|   Polygon     |     Mumbai      | :heavy_check_mark: | :x: |
|   Arbitrum    |     Mainnet     | :heavy_check_mark: | :x: |
|   BSC         |     Mainnet     | :heavy_check_mark: | :x: |
|   Fantom      |     Mainnet     | :heavy_check_mark: | :x: |

* For us to add your requesting smart contract to our `job-spec.toml` whitelist, please contact us on our [Discord](https://discord.gg/xkWAfW9D6c) and give us the smart contract address.

* For unsupported Mainnet networks, if the network you are requesting is listed [here](https://docs.chain.link/docs/link-token-contracts/): please contact us on [Discord](https://discord.gg/xkWAfW9D6c)

## Private & Custom data requests 	:dark_sunglasses:

* All jobs listed in this repo are of the `GET` format (ex: `curl GET https://api-endpoint-example.com`).

* If your projects requirements need a private `POST` format (ex: `curl POST https://api-endpoint-example.com`), please contact us on our discord.

[Testnet Channel](https://discord.gg/TsCufjeQkn)

[Mainnet Channel](https://discord.gg/xkWAfW9D6c)

## Troubleshooting: :hammer_and_wrench:
[1] Correct LINK token, please check [Chainlink documentation](https://docs.chain.link/docs/link-token-contracts/) and the notes related to the network you are sending oracle requests on for ERC20 vs ERC677 LINK tokens.

[2] Correct oracle address corresponding to our documentation per network.

[3] Correct job-id, please check that the job-id loaded into the smart contract does not contain any dashes "-".

[4] Correct API endpoint for `curl GET` or `curl POST` format, please check before sending an oracle request with your desired API endpoint.

  * For `curl POST` please get in contact with us on [Discord](https://discord.gg/PgxRVrDUm7) to properly handle this type of oracle requests.

[5] Correct JSON path from API endpoint output. Please note array notation (ex: 0 for the first array), etc.

## Support: :telephone_receiver:
Please reach out to us in our [Discord](https://discord.gg/PgxRVrDUm7) for further assistance, questions, or pricing information.

## Oracle Job Archive: :scroll:
For most of the common direct requests which our developers have requested, see our entire job template [archive](https://github.com/Block-Farms/Chainlink-Job-Spec-Template-Smart-Contract-Archive/tree/main/2_Direct_Request).
