// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract simpleStorage{

    uint256 public favNum;

    function store(uint256 _favNUm) public {
        favNum = _favNUm;
        favNum = favNum+1;
    }

    struct Person{
        uint256 favn;
        string name;
    }

     Person public he  = Person(7,"helo");

    function ret() public  view  returns(uint256){
        return  favNum;
    }

    Person[] public lop;
    mapping (string => uint256) public natoFav;

    function addPerson(uint256 _favn, string memory _name) public {
        lop.push(Person(_favn, _name));
        natoFav[_name] = _favn;
    }

}
