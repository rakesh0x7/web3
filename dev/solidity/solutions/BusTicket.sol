// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract TicketBooking {

   uint256[20] public totalseats;

    mapping(address => uint[]) useraddr; 

    function bookSeats(uint[] memory seat) public {
        uint count = seat.length;
        require(count > 0);
        
        
        require(useraddr[msg.sender].length+seat.length <=4, "Transaction Fail" );

        
        for(uint256 i=0;i<seat.length;i++){
            uint s = seat[i];
            if(totalseats[s-1] == 1 || s == 0 || s > 20) { revert(); }

            totalseats[s-1] = 1;
             useraddr[msg.sender].push(seat[i]);
        }

    }

    function checkAvailability(uint seatNumber) public view  returns (bool) {
        require(seatNumber>0, "Transaction Fail");
        for (uint256 i = 0; i < totalseats.length; i++) {
            if (totalseats[seatNumber-1] == 0) {
               return true;
            }
        }
        return false;
    }
    function showAvailableSeats() public view returns (uint[] memory) {
        uint[] memory availableSeats = new uint[](totalseats.length); 
        uint count = 0; 
        for (uint256 i = 0; i < totalseats.length; i++) {
            if (totalseats[i] == 0) {
                availableSeats[count] = i + 1; 
                count++;
            }
        }
        assembly {
                mstore(availableSeats, count)
            }
        return availableSeats;
    }
    function myTickets() public view returns (uint[] memory) {
     
        return useraddr[msg.sender];

    }
}

// https://dapp-world.com/problem/bus-ticket-1/problem