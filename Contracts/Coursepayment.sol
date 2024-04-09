// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import "@openzeppelin/contracts/access/Ownable.sol";

contract CoursePayment is Ownable {
    
    uint256 public fee;

    struct Payment{
        address user;
        string email;
        uint256 amount;
    }
    
    Payment[] public payments;
   
    constructor(uint256 _fee) Ownable(msg.sender) {
        fee = _fee;
    }

    event feePaid(address user, string email, uint256 amount);

    function buyCourse(string memory email) public  payable {
        require(msg.value==fee,"Payment should be equal to course payment");
        payments.push(Payment(msg.sender,email,msg.value));
        emit feePaid(msg.sender, email, msg.value);
    }
    
    function withdraw() external onlyOwner { // Restrict access with modifier
        // uint amount = address(this).balance;
        // require(amount > 0, "No funds to withdraw");

        // (bool success, ) = msg.sender.call{value: amount}(""); 
        payable(owner()).transfer(address(this).balance);
        // require(success, "Withdrawal failed");
    }

  
}

// 0x527199490e7baf6a4dc6cf2b97fe2e2c5c248eb8