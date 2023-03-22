// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "./IPerson.sol";

interface IEmployee {
    function addContact(address contact, bytes32 name, bytes32 position) external;

    function changeColleaguePosition(address contact, bytes32 position) external;

    event EmployeeInitialized(address indexed employee, address indexed boss);

    event ColleagueAdded(address indexed contact, bytes32 name, bytes32 position);

    event ColleagueUpdated(address indexed contact, bytes32 oldPosition, bytes32 newPosition);
}
