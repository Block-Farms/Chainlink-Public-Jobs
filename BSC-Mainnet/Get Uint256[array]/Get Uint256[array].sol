// SPDX-License-Identifier: MIT
// block-farms.io
// Discord=https://discord.gg/PgxRVrDUm7

pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";
import "@chainlink/contracts/src/v0.8/ConfirmedOwner.sol";

contract getUint256ArrayTemplate is ChainlinkClient, ConfirmedOwner {
  using Chainlink for Chainlink.Request;

  uint256[] public array;

  bytes32 private externalJobId;
  uint256 private oraclePayment;

  constructor() ConfirmedOwner(msg.sender){
    setChainlinkToken(0x404460c6a5ede2d891e8297795264fde62adbb75);
    setChainlinkOracle(0x3d5552a177Fe380CDDe28a034EA93C2d30b80b2D);
    externalJobId = "90ec64e83b32429b958deb238a23eeed";
    oraclePayment = ((15 * LINK_DIVISIBILITY) / 100); // n * 10**18
  }

  function requestArray()
    public
    onlyOwner
  {
    Chainlink.Request memory req = buildChainlinkRequest(externalJobId, address(this), this.fulfillArray.selector);
    req.add("get", "https://API_ENDPOINT_URL");
    req.add("path", "data,results");
    sendOperatorRequest(req, oraclePayment);
  }

  event RequestFulfilledArray(bytes32 indexed requestId, uint256[] _array);

  function fulfillArray(bytes32 requestId, uint256[] memory _array)
    public
    recordChainlinkFulfillment(requestId)
  {
    emit RequestFulfilledArray(requestId, _array);
    array = _array;
  }
}
