// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "../interfaces/IAnimal.sol";

abstract contract Animal is IAnimal {
    address public owner;
    string public name;

    modifier onlyOwner(address _owner) {
        require(owner == _owner, "ONLY OWNER FUNCTION");
        _;
    }

    constructor(address _owner, string memory _name) {
        name = _name;
        owner = _owner;

        emit AnimalInitialized(owner, name);
    }

    function changeOwner(address _newOwner) external onlyOwner(_newOwner) {
        address oldOwner = owner;
        owner = _newOwner;
        emit OwnerUpdated(oldOwner, _newOwner);
    }

    function callOwner() external virtual returns (string memory);
}
