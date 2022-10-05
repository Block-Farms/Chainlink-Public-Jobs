// SPDX-License-Identifier: MIT
// block-farms.io
// Discord=https://discord.gg/PgxRVrDUm7

pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";
import "@chainlink/contracts/src/v0.8/ConfirmedOwner.sol";

contract getUintTemplate is ChainlinkClient, ConfirmedOwner {
  using Chainlink for Chainlink.Request;

  int256 public int;
  
  bytes32 private externalJobId;
  int256 private oraclePayment;
  address private oracle;
  
  event RequestIntFulfilled(bytes32 indexed requestId,int256 indexed int);

  constructor() ConfirmedOwner(msg.sender){
    setChainlinkToken(0xf97f4df75117a78c1A5a0DBb814Af92458539FB4);
    oracle = 0x41fC087cd79fC67f6234B721f8A8AdE68d8aeB8E;
    externalJobId = "e07fd3ed28544479bb1973e9c3379780";
    oraclePayment = ((1 * LINK_DIVISIBILITY) / 10); // n * 10**18
  }

  function requestInt()
    public
    onlyOwner
  {
    Chainlink.Request memory req = buildChainlinkRequest(externalJobId, address(this), this.fulfillInt.selector);
    req.add("get", "https://YOUR_API_ENDPOINT_URL");
    req.add("path", "data,results");
    req.addInt("times", 100);
    sendChainlinkRequestTo(oracle, req, oraclePayment);
  }

  function fulfillInt(bytes32 _requestId, int256 _Int)
    public
    recordChainlinkFulfillment(_requestId)
  {
    emit RequestIntFulfilled(_requestId, _Int);
    Int = _Int;
  }

}
