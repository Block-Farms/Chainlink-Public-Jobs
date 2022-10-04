// SPDX-License-Identifier: MIT
// block-farms.io
// Discord=https://discord.gg/PgxRVrDUm7

pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";
import "@chainlink/contracts/src/v0.8/ConfirmedOwner.sol";

contract getBoolTemplate is ChainlinkClient, ConfirmedOwner {
  using Chainlink for Chainlink.Request;

  bool public boolean;
  
  bytes32 private externalJobId;
  uint256 private oraclePayment;
  address private oracle;

  event RequestBoolFulfilled(bytes32 indexed requestId,bool indexed boolean);

  constructor() ConfirmedOwner(msg.sender){
  setChainlinkToken(0x326C977E6efc84E512bB9C30f76E30c160eD06FB);
  oracle = 0x103Ca41fa1257d5014b04b6B212B251e9E7A740a;
  externalJobId = "975409ce0ed84d87bad2a6e503cccf0e";
  oraclePayment = (0.0 * LINK_DIVISIBILITY); // n * 10**18
  }

  function requestBool()
    public
    onlyOwner
  {
    Chainlink.Request memory req = buildChainlinkRequest(externalJobId, address(this), this.fulfillBool.selector);
    req.add("get", "https://YOUR_API_ENDPOINT_URL");
    req.add("path", "data,results");
    sendChainlinkRequestTo(oracle, req, oraclePayment);
  }

  function fulfillBool(bytes32 _requestId, bool _boolean)
    public
    recordChainlinkFulfillment(_requestId)
  {
    emit RequestBoolFulfilled(_requestId, _boolean);
    boolean = _boolean;
  }

}
