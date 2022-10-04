// SPDX-License-Identifier: MIT
// block-farms.io
// Discord=https://discord.gg/PgxRVrDUm7

pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";
import "@chainlink/contracts/src/v0.8/ConfirmedOwner.sol";

contract getUintTemplate is ChainlinkClient, ConfirmedOwner {
  using Chainlink for Chainlink.Request;

  uint256 public Uint;
  
  bytes32 private externalJobId;
  uint256 private oraclePayment;
  address private oracle;
  
  event RequestUintFulfilled(bytes32 indexed requestId,uint256 indexed Uint);

  constructor() ConfirmedOwner(msg.sender){
    setChainlinkToken(0xb0897686c545045aFc77CF20eC7A532E3120E0F1);
    oracle = 0xf01885a85Ab503E21D8327d2e33AfD358fE4F0Ba;
    externalJobId = "a052732022e04e89be3e0fc06e457985";
    oraclePayment = ((1 * LINK_DIVISIBILITY) / 10); // n * 10**18
  }

  function requestUint()
    public
    onlyOwner
  {
    Chainlink.Request memory req = buildChainlinkRequest(externalJobId, address(this), this.fulfillUint.selector);
    req.add("get", "https://YOUR_API_ENDPOINT_URL");
    req.add("path", "data,results");
    req.addInt("times", 100);
    sendChainlinkRequestTo(oracle, req, oraclePayment);
  }

  function fulfillUint(bytes32 _requestId, uint256 _Uint)
    public
    recordChainlinkFulfillment(_requestId)
  {
    emit RequestUintFulfilled(_requestId, _Uint);
    Uint = _Uint;
  }

}
