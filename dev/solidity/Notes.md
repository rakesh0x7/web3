The foundry commands - https://github.com/t4sk/hello-foundry

- compile contract
    
    ```jsx
    forge build
    ```
    

- to test
    
    ```jsx
    forge test -VVVV
    ```
    

- compiling manually
    
    ```solidity
    forge create ContractName --interactive
    ```
    
- compiling and deploying using scripts
    
    ```solidity
    forge script script/Counter.s.sol  #temp anvil chain
    
    forge script script/Counter.s.sol --rpc-url http://127.0.0.1:8545 --broadcast --private-key 0x5de4111afa1a4b94908f83103eb1f1706367c2e68ca870fc3fb9a804cdab365a  #specifyig normal anvil
    ```
    
- use `cast` command to convert from hex dec and it’s inbuilt in foundry
    
    ```solidity
    cast --to-base 0x714c2 dec
    ```
    
- we can use cast to call the function (check docs - https://book.getfoundry.sh/cast/ )
    
    ```solidity
    // send fucntion
    cast send deployedaddress "functionname(uint25)" data --rpc-url url --private-key key
    ```
    
    ```solidity
    //call function
    cast call 0x6b175474e89094c44da98b954eedeac495271d0f "totalSupply()(uint256)" data --rpc-url https://elocalhost
    ```
    
- we need to install the import explicitly
    
    ```solidity
    forge install smartcontractkit/chainlink-brownie-contracts@0.6.1 --no-commit
    ```
    
- using forge coverage will got to know how much of our code is tested
    
    ```solidity
    forge coverage
    ```