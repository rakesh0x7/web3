// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract MaxNumberContract {

    function findMaxNumber(uint256[] memory numbers) external pure returns (uint256) {
        uint256 greatest = 0;
       for(uint256 i =0; i<=numbers.length;i++){
            if (numbers[i] > greatest){
                greatest = numbers[i];
            }
       }
       return greatest;
    }
}

