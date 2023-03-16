// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

interface IPerson {
    function addContact(address, bytes32) external;

    event PersonInitialized(address indexed owner);
    event ContactAdded(address indexed contact, bytes32 name);
}

/**
 * All functions declared inside an interface are implicitly virtual . 
 * 
 * They are virtual by default, even if they do not include the 
 * virtual keyword in their definition inside the interface.

Any function that overrides them (= the actual function implementation) 
do not need the override keyword. 
This specificity was introduced in Solidity 0.8.8, 
as the Solidity docs state:

Starting from Solidity 0.8.8, the override keyword is not required when 
overriding an interface function…
 */

/**
 * However, this is not always the case. Exceptions exist.

…except for the case where the function is defined in multiple bases.

Another rule about these function implementations is that 
“it is not because a function overrides the function defined 
in an interface that 
it can automatically be overridden again 
in a future inherited contract”. 
This is only possible when the overriding function 
is marked virtual in turn.
 */
