// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

interface IAnimal {
    function changeOwner(address _newOwner) external;

    function callOwner() external returns (string memory);

    event AnimalInitialized(address indexed owner, string name);

    event OwnerUpdated(address indexed oldOwner, address indexed _newOwner);
}
