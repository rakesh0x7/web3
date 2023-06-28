// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "simpleStorage.sol";

contract Addfive is simpleStorage {

    function store(uint256 _favnum) public  override {
        favNum = _favnum +5;
    }
}
