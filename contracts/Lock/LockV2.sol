// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "../interfaces/ILock.sol";

contract LockV2 is ILock {
    uint public unlockTime;
    address payable public owner;

    constructor(uint _unlockTime) payable {
        require(block.timestamp < _unlockTime, "Unlock time should be in the future");
        /**
         * It is equal to:
         *
         * if(block.timestamp > _unlockTime){
         *      revert UnlockTimeNotFuture(_unlockTime);
         * }
         *
         */

        unlockTime = _unlockTime;
        owner = payable(msg.sender);
    }

    function withdraw() public {
        if (block.timestamp < unlockTime) {
            revert NotUnlockTime(block.timestamp);
        }
        if (msg.sender != owner) {
            revert NotOwner(msg.sender);
        }

        emit Withdrawal(address(this).balance, block.timestamp);

        owner.transfer(address(this).balance);
    }
}
