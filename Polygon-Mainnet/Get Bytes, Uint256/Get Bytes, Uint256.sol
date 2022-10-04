// SPDX-License-Identifier: MIT
// block-farms.io
// Discord=https://discord.gg/PgxRVrDUm7

pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";

contract getMultiDataTypeTemplate is ChainlinkClient {
  using Chainlink for Chainlink.Request;

  bytes public data;
  string public convertedBytes;
  uint256 public amount;

  bytes32 private externalJobId;
  uint256 private oraclePayment;

  constructor(
  ) {
    setChainlinkToken(0xb0897686c545045aFc77CF20eC7A532E3120E0F1);
    setChainlinkOracle(0x14fB588AD6DA21d7F790D477354DE923AE5BeB07);
    externalJobId = "293676225a0e49ec9828b2cb593dcf39";
    oraclePayment = ((15 * LINK_DIVISIBILITY) / 100); // n * 10**18
  }


  function requestAddressAndAmount(
  )
    public
  {
    Chainlink.Request memory req = buildChainlinkRequest(externalJobId, address(this), this.fulfillBytes.selector);
    req.add("get", "https://API_endpoint_url");
    req.add("path1", "data,results1");
    req.add("path2", "data,results2");
    req.addInt("times", 100);
    sendOperatorRequest(req, oraclePayment);
  }

  event RequestFulfilled(bytes32 indexed requestId,bytes indexed data,uint256 amount);

  function fulfillBytes(bytes32 requestId, bytes memory bytesData, uint256 _amount)
    public
    recordChainlinkFulfillment(requestId)
  {
    emit RequestFulfilled(requestId, bytesData, _amount);
    data = bytesData;
    convertedBytes = string(data);
    amount = _amount;
  }

}
