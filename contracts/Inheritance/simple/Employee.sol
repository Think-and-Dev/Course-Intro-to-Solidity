// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;
import "../../interfaces/IEmployee.sol";
import "./Person.sol";

contract Employee is Person, IEmployee {
    address public boss;
    uint256 colleaguesCounter;
    mapping(address => bytes32) public colleagues;

    modifier isValidAddress(address _addr) {
        require(_addr != address(0), "NOT VALID ADDRESS");
        _;
    }

    constructor(address _owner, address _boss) Person(_owner) {}

    function addContact(address _contact, bytes32 name) public override {
        require(contacts[_contact] != bytes32(0), "Contact already set");
        super.addContact(_contact, name);
        colleaguesCounter++;
    }

    function addContact(address _contact, bytes32 name, bytes32 _position) external {
        super.addContact(_contact, name);
        colleaguesCounter++;
        colleagues[_contact] = _position;
    }
}
