//SPDX-License-Identifier:MIT
pragma solidity ^0.6.0;
pragma experimental ABIEncoderV2;

contract Verify {

    function verifySig(address _signer, string memory _message,bytes memory _sig) 
     external pure returns(bool){
           bytes32 messageHash= generateHash(_message);
           bytes32 ethSignedMsg= getSignedMsg(messageHash);

           return recover(ethSignedMsg,_sig)==_signer;
    }

    function generateHash(string memory _message) public pure returns(bytes32) {
        return keccak256(abi.encodePacked(_message));

    }
    function getSignedMsg(bytes32 _message) public pure returns(bytes32) {
        return keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32",_message));

    }
    function recover(bytes32 _signedMsg, bytes memory _sig) public pure  returns(address){
        (bytes32 r, bytes32 s, uint8 v) =_split(_sig);
        return ecrecover(_signedMsg,v,r,s);
    }
   function _split(bytes memory _sig) internal pure returns (bytes32 r, bytes32 s, uint8 v)
   {
   require(_sig.length==65, 'invalid signature');
   assembly {
       r := mload(add(_sig,32))
       s := mload(add(_sig,64))
       v := byte(0,mload(add(_sig,96)))
   }

   }
    
    
}