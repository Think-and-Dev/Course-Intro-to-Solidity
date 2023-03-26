// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "./SolowMathLibrary.sol";

contract Student {
    using SolowMathLibrary for SolowMathLibrary.Point;

    address public owner;
    uint256 public numberOfExcercises;

    event StudentInitialized(address owner);
    event HomeworkDone(uint256 timestamp);

    constructor(address _owner) {
        require(_owner != address(0), "Invalid owner");
        owner = _owner;
        emit StudentInitialized(owner);
    }

    function doHomework(
        SolowMathLibrary.Point memory a,
        SolowMathLibrary.Point memory b
    ) external returns (SolowMathLibrary.Point memory) {
        SolowMathLibrary.Point memory result = a.vectorialProduct(b);
        numberOfExcercises++;
        emit HomeworkDone(block.timestamp);
        return result;
    }
}
