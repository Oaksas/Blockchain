//SPDX-License-Identifier:MIT
pragma solidity ^0.6.0;

contract Fundme{
    mapping(address=>uint256) public contributors;

    function fund() public payable {
        contributors[msg.sender]+=msg.value;
    }


}
