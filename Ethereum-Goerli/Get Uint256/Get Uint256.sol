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
    setChainlinkToken(0x326C977E6efc84E512bB9C30f76E30c160eD06FB);
    oracle = 0x090A0962e36b9BE9dd7f7Bd60Ff8018a23ABD52E;
    externalJobId = "a052732022e04e89be3e0fc06e457985";
    oraclePayment = (0.0 * LINK_DIVISIBILITY); // n * 10**18
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
