// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract FactorialContract {

    function calculateFactorial(uint256 n) public pure returns (uint256) {
        if(n==0){
            return 1;
        }
        else{
            return n*calculateFactorial(n-1);
        }
     
    }
}

