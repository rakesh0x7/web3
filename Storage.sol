// SPDX-License-Identifier: MIT

// deploying one contract from another contractor

pragma solidity ^0.8.18;

import {simpleStorage} from "simpleStorage.sol";

contract Storage{

    simpleStorage public  mysimpleStorage;

    simpleStorage[] public  listofsimplecontracts;

    function create1simpleStorage() public {
        mysimpleStorage   =   new simpleStorage();
    }

// to create list of contracts -> storing in simplestorage contractor array
    function createlistofSimpleStorage() public {
        simpleStorage listcontractor = new simpleStorage();
        listofsimplecontracts.push(listcontractor);
    }

    function sfstore(uint256 _indexnum, uint256 _favnum) public {
        simpleStorage listcontractor = listofsimplecontracts[_indexnum];
        listcontractor.store(_favnum);
    }

        function sfstoreretrive(uint256 _indexnum) public view returns (uint256)  {
        simpleStorage listcontractor = listofsimplecontracts[_indexnum];
        return listcontractor.ret();
    }

}
