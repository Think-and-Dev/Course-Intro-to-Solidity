// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "./AbstractAnimal.sol";

contract Cat is Animal {
    constructor(address _owner, string memory _name) Animal(_owner, _name) {}

    function callOwner() external pure override returns (string memory) {
        return "Miau";
    }
}
