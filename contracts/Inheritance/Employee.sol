// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;
import "../interfaces/IEmployee.sol";
import "./Person.sol";

/***
 * El contrato Employee HEREDA del contrato Person
 * El contrato Employee IMPLEMENTA la interfaz IEmployee
 */

contract Employee is Person, IEmployee {
    address public boss;
    uint256 colleaguesCounter;
    mapping(address => bytes32) public colleagues;

    modifier isValidAddress(address _addr) {
        require(_addr != address(0), "NOT VALID ADDRESS");
        _;
    }

    constructor(address _owner, address _boss) Person(_owner) isValidAddress(_boss) {
        boss = _boss;
        emit EmployeeInitialized(_owner, _boss);
    }

    function addContact(address _contact, bytes32 name) public override {
        require(contacts[_contact] == bytes32(0), "Contact already set");
        super.addContact(_contact, name);
        colleaguesCounter++;
    }

    function addContact(address _contact, bytes32 name, bytes32 _position) external {
        super.addContact(_contact, name);
        colleaguesCounter++;
        colleagues[_contact] = _position;
        emit ColleagueAdded(_contact, name, _position);
    }

    function changeColleaguePosition(address _contact, bytes32 _position) external onlyOwner {
        require(colleagues[_contact] != bytes32(0), "Colleague not set");
        bytes32 oldPosition = colleagues[_contact];
        colleagues[_contact] = _position;
        emit ColleagueUpdated(_contact, oldPosition, _position);
    }
}
