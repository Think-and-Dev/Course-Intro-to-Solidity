// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "./MathLibrary.sol";

contract Student {
    using MathLibrary for MathLibrary.Point;

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
        MathLibrary.Point memory a,
        MathLibrary.Point memory b
    ) external returns (MathLibrary.Point memory) {
        MathLibrary.Point memory result = a.vectorialProduct(b);
        numberOfExcercises++;
        emit HomeworkDone(block.timestamp);
        return result;
    }
}
