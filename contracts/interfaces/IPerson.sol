// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

interface IPerson {
    function addContact(address, bytes32) external;

    event PersonInitialized(address indexed owner);
    event ContactAdded(address indexed contact, bytes32 name);
}
