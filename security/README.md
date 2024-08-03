<details>
<summary>Smart contracts, which are self-executing contracts with the terms of the agreement directly written into code, often on blockchain platforms like Ethereum, can be vulnerable to various types of attacks or failures. Here's a comprehensive list of common vulnerabilities that can affect smart contracts: </summary>  `

1. <b>Reentrancy Attacks</b>: This occurs when external contract calls are allowed to make new calls to the calling contract before the initial execution is complete. The most famous example of this is the DAO attack.

2. <b>Arithmetic Overflows and Underflows</b> Smart contract languages like Solidity use fixed-size integers, and arithmetic operations can overflow or underflow without proper checks.

3. <b>Unintended Ether Balance</b> Contracts can unintentionally receive Ether via direct transfers to the contract address, <b>`selfdestruct`</b> method, or mining rewards, which may affect the contract logic.

4. <b>Gas Limit and Loops</b> Functions with loops that consume varying amounts of gas can run out of gas unexpectedly if not properly managed, leading to denial of service.

5. <b>Timestamp Dependence</b> Using block timestamps for randomness or critical logic can be risky as miners can manipulate timestamps to some degree.

6. <b>Blockhash Dependency</b> Using <b>`blockhash</b> for functionality like random number generation is unsafe for blocks older than the last 256 because older hashes return zero.

7. <b>Unchecked External Calls</b> If external calls fail, the contract must handle the failure correctly; otherwise, it may result in unintended behavior.

8. <b>Short Address/Parameter Attack</b> When the user interface does not properly validate input, an attacker can manipulate transactions by appending fewer bytes to the payload.

9. <b>Denial of Service (DoS) with (Unexpected) Throw</b> If a contract relies on other contracts and those contracts fail or revert, it can halt the entire system.

10. <b>Front Running</b> Transactions on public blockchains can be seen in the mempool before being mined, allowing attackers to execute a transaction first by offering a higher gas price.

11. <b>Randomness and PRNG in Blockchain</b> Secure randomness is hard to achieve on deterministic systems like blockchains; using insecure methods can lead to predictable outcomes.

12. <b>Delegatecall Injection</b> If a contract uses <b>`delegatecall</b> to a user-supplied address, malicious contract code can be executed in the context of the calling contract.

13. <b>Phishing with tx.origin</b> If contracts use <b>`tx.origin</b> for authentication, attackers can trick users into executing transactions that seem harmless but can lead to attacks.

14. <b>Storage Collisions</b> Solidity allows for storage variables to be defined without initialising them, leading to potential collisions through poorly set up inheritance structures.

15. <b>Improper Access Control</b> Functions that should be restricted to certain users might be exposed to anyone on the network due to improper access control settings.

</details>   

---

<details>
<summary>Immunefi Top 10 </summary>

1. <b>Improper Input Validation <b>

2. <b>Incorrect Calculation <b>

3. <b>Oracle/Price Manipulation <b>

4. <b>Weak Access Control <b>

5. <b>Signature Malleability <b>

6. <b>Rounding Errors<b>

7. <b>Reentrancy<b>

8. <b>Front-Running & Sandwich<b>

9. <b>Uninitialized Proxy <b>

10. <b>Dao And Governance Attacks<b>

</details>

---

<details>
<summary>Common Vulnerabilities in Smart contracts:</summary>

-  [What is Reentrancy.](https://swcregistry.io/docs/SWC-107)
-  [What is Junk code (Code With No Effects).](https://swcregistry.io/docs/SWC-135)
-  [What is Unencrypted Private Data On-Chain.](https://swcregistry.io/docs/SWC-136)
-  [What is Integer Overflow and Underflow.](https://swcregistry.io/docs/SWC-101)
-  [What is Floating `Pragma`.](https://swcregistry.io/docs/SWC-103)
-  [What is Unchecked Call Return Value.](https://swcregistry.io/docs/SWC-104)
-  [What is Unprotected `SELFDESTRUCT` Instruction.](https://swcregistry.io/docs/SWC-106)
-  [State Variable Default Visibility.](https://swcregistry.io/docs/SWC-108)
-  [What is Uninitialized Storage Pointer.](https://swcregistry.io/docs/SWC-109)
-  [Use of Deprecated Solidity Functions.](https://swcregistry.io/docs/SWC-111)
-  [DoS with Failed Call.](https://swcregistry.io/docs/SWC-113)
-  [Authorization through `tx.origin`](https://swcregistry.io/docs/SWC-115)
-  [Signature Malleability.](https://swcregistry.io/docs/SWC-117)
-  [Weak Sources of Randomness from Chain Attributes.](https://swcregistry.io/docs/SWC-120)
-  [Lack of Proper Signature Verification.](https://swcregistry.io/docs/SWC-122)
-  [Missing Protection against Signature Replay Attacks.](https://swcregistry.io/docs/SWC-121)
-  [Insufficient Gas Griefing.](https://swcregistry.io/docs/SWC-126)
-  [DoS With Block Gas Limit.](https://swcregistry.io/docs/SWC-128)
-  [Hash Collisions With Multiple Variable Length Arguments.](https://swcregistry.io/docs/SWC-133)
-  [Message call with hardcoded gas amount.](https://swcregistry.io/docs/SWC-134)
-  [Oracle Manipulation.](https://hackernoon.com/how-dollar100m-got-stolen-from-defi-in-2021-price-oracle-manipulation-and-flash-loan-attacks-explained-3n6q33r1)

</details>