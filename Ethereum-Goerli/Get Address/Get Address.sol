// SPDX-License-Identifier: MIT
// block-farms.io
// Discord=https://discord.gg/PgxRVrDUm7

pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";

contract getAddressTemplate is ChainlinkClient {
  using Chainlink for Chainlink.Request;

  address public addressVariable;

  bytes32 private externalJobId;
  uint256 private oraclePayment;

  event RequestFulfilled(bytes32 indexed requestId,address indexed addressVariable);

  constructor() {
    setChainlinkToken(0x326C977E6efc84E512bB9C30f76E30c160eD06FB);
    setChainlinkOracle(0xedaa6962Cf1368a92e244DdC11aaC49c0A0acC37);
    externalJobId = "b91fd273ac784d6e96d6e7f5ad6f441c";
    oraclePayment = (0.0 * LINK_DIVISIBILITY); // n * 10**18

  }

  function RequestAddress()
    public
  {
    Chainlink.Request memory req = buildChainlinkRequest(externalJobId, address(this), this.fulfillAddress.selector);
    req.add("get", "https://API_endpoint_url");
    req.add("path1", "data,results");
    sendOperatorRequest(req, oraclePayment);
  }

  function fulfillAddress(bytes32 requestId,address _addressVariable)
    public
    recordChainlinkFulfillment(requestId)
  {
    emit RequestFulfilled(requestId, _addressVariable);
    addressVariable = _addressVariable;
  }

}
