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
    setChainlinkToken(0xf97f4df75117a78c1A5a0DBb814Af92458539FB4);
    setChainlinkOracle(0xc2566feCE70C46085FD50013dDd2408311dE99D4);
    externalJobId = "b91fd273ac784d6e96d6e7f5ad6f441c";
    oraclePayment = ((15 * LINK_DIVISIBILITY) / 100); // n * 10**18
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
