// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.17;

import "./DeloreanAPI.sol";

/// @title A demo contract to show what is possible with Delorean protocol
/// @author BadBoi Labs 
/// @dev The contract releases the key when requested
contract DeloreanDemo {
    
    bytes32 constant MEMO = 0x1111111111111111111111111111111111111111111111111111111111111111; // this is to allow a contract to manage multiple keys

    function releaseKey() public returns (bool) {
        DeloreanAPI.enqueueTag(MEMO);
        return (true);
    }

    // Helper function to allow retrieving the bytes32 tag that the validators will be signing
    // which includes the contract address as well as the variable tag component
    function signingTag() public view returns (bytes32) {
        return keccak256(abi.encodePacked(address(this), MEMO));
    }

}
