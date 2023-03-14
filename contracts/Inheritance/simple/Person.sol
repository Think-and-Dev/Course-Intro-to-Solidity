// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;
import "../../interfaces/IPerson.sol";

contract Person is IPerson {
    address public owner;
    mapping(address => bytes32) contacts;

    constructor(address _owner) {
        require(_owner != address(0), "Invalid owner address");
        owner = _owner;
        emit PersonInitialized(owner);
    }

    function addContact(address _contact, bytes32 name) external {
        require(_contact != address(0), "Invalid contact address");
        contacts[_contact] = name;
        emit ContactAdded(_contact, name);
    }
}
