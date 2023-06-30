
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;


import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
import {PriceConverter} from "PriceConvereter.sol";

error notowner();

contract Fund{

    using PriceConverter for uint256;

    address public immutable i_owner ;
    uint256 public constant MINIMUM_USD = 2 * 10 ** 18;

    mapping(address  => uint256 ) public addressToAmountFunded;
    address[] public funders;

   constructor(){
       i_owner = msg.sender;
   }

    function fund() public payable {
        require(msg.value.conversionRate() > MINIMUM_USD, "doesn't match minimum usd");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;
    } 


    function withdraw() external payable onlyowner {
        for(uint256 i=0;i<funders.length;i++){
            address funder = funders[i];
            addressToAmountFunded[funder] = 0;
        }
         funders = new address[](0);
         (bool callsucess,) = payable(msg.sender).call{value:address(this).balance}("");
         require(callsucess, "failed");
    }

    modifier onlyowner{
        if(msg.sender != i_owner) revert notowner();
        _;
    }

    receive() external payable {
        fund();
    }

        fallback() external payable {
        fund();
    }
}
