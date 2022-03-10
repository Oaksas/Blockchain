//SPDX-License-Identifier:MIT
pragma solidity ^0.6.0;
pragma experimental ABIEncoderV2;
import "./test.sol";

contract working is Verify{
    Verify[] public contracts;
    function creatMindplexes() public {
        Verify newMind= new Verify();
        contracts.push(newMind);
    }

    function returnContract(uint32 index) public view returns(Verify){
        return contracts[index];

    }



}