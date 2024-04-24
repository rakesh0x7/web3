// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract SmartRanking {

    //this function is used to insert the marks
    mapping (uint => uint) marks;
    uint topperMark;
    uint topperrollNumber;
    
    function insertMarks(uint _rollNumber, uint _marks) public {
        require(_rollNumber>=0);
        require(_marks>=0);
        if(topperMark<_marks){
            topperMark = _marks;
            topperrollNumber = _rollNumber;
        }

    }

    //this function returns the hightest marks obtained by student
    function topperMarks() public view returns(uint) {require(topperMark>0); return topperMark;}

    //this function returns the roll number of student having highest marks
    function topperRollNumber() public view returns(uint) {require(topperrollNumber>0); return topperrollNumber;}

}

// https://dapp-world.com/problem/smart-ranking-easy-MeDf/problem