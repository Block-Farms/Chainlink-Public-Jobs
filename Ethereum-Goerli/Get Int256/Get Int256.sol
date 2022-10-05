// SPDX-License-Identifier: MIT
// block-farms.io
// Discord=https://discord.gg/PgxRVrDUm7

pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";
import "@chainlink/contracts/src/v0.8/ConfirmedOwner.sol";

/**
 * THIS IS AN EXAMPLE CONTRACT WHICH USES HARDCODED VALUES FOR CLARITY.
 * THIS EXAMPLE USES UN-AUDITED CODE.
 * DO NOT USE THIS CODE IN PRODUCTION.
 */
 
contract getIntTemplate is ChainlinkClient, ConfirmedOwner {
  using Chainlink for Chainlink.Request;

  int256 public Int;
  
  bytes32 private externalJobId;
  uint256 private oraclePayment;
  address private oracle;
  
  event RequestIntFulfilled(bytes32 indexed requestId,int256 indexed Int);

  constructor() ConfirmedOwner(msg.sender){
    setChainlinkToken(0x326C977E6efc84E512bB9C30f76E30c160eD06FB);
    oracle = 0x090A0962e36b9BE9dd7f7Bd60Ff8018a23ABD52E;
    externalJobId = "e07fd3ed28544479bb1973e9c3379780";
    oraclePayment = (0.0 * LINK_DIVISIBILITY); // n * 10**18
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
