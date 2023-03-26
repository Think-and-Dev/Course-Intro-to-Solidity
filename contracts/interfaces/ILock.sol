// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

interface ILock {
    function withdraw() external;

    event Withdrawal(uint amount, uint when);

    error UnlockTimeNotFuture(uint _unlockTime);
    error NotUnlockTime(uint _currentTimestamp);
    error NotOwner(address _owner);
}
