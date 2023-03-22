// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

interface IAnimal {
    function callOwner() external returns (string memory);

    function changeOwner(address _newOwner) external;

    event AnimalInitialized(address indexed owner, string name);

    event OwnerUpdated(address indexed oldOwner, address indexed _newOwner);
}
