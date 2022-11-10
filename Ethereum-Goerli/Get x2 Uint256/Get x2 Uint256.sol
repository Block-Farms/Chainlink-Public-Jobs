// SPDX-License-Identifier: MIT
// block-farms.io
// Discord=https://discord.gg/PgxRVrDUm7

pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";
import "@chainlink/contracts/src/v0.8/ConfirmedOwner.sol";

contract getMultiVariableTemplate is ChainlinkClient, ConfirmedOwner {
  using Chainlink for Chainlink.Request;

  bytes32 private externalJobId;
  uint256 private oraclePayment;

  uint256 public Value2;
  uint256 public Value1;

  constructor() ConfirmedOwner(msg.sender){
  setChainlinkToken(0x326C977E6efc84E512bB9C30f76E30c160eD06FB);
  setChainlinkOracle = 0xedaa6962Cf1368a92e244DdC11aaC49c0A0acC37;
  externalJobId = "d3439590d6b047a38f1cd984154b1c0e";
  oraclePayment = (0.0 * LINK_DIVISIBILITY); // n * 10**18
  }

  function requestValue1AndValue2()
    public
    onlyOwner
  {
    Chainlink.Request memory req = buildChainlinkRequest(externalJobId, address(this), this.fulfillValue1AndValue2.selector);
    req.add("get", "https://YOUR_API_ENDPOINT_URL");
    req.add("path1", "data,results1");
    req.add("path2", "data,results2");
    req.addInt("times", 100);
    sendOperatorRequest(req, oraclePayment);
  }

  event RequestFulfilledValue1AndValue2(bytes32 indexed requestId, uint256 indexed Value2, uint256 indexed Value1);

  function fulfillValue1AndValue2(bytes32 requestId, uint256 _Value2, uint256 _Value1)
    public
    recordChainlinkFulfillment(requestId)
  {
    emit RequestFulfilledValue1AndValue2(requestId, _Value2, _Value1);
    Value1 = _Value1;
    Value2 = _Value2;
  }

}
