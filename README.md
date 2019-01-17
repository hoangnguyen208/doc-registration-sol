# doc-registration-sol

### Description
A simple smart contract written in Solidity that can be deployed to main HTMLCOIN blockchain. This smart contract is used for registering documents to HTMLCOIN blockchain.

### Deployment
- Installs HTMLCOIN wallet: https://www.htmlcoin.com/wallets
- Copies the smart contract code from DocRegistration.sol to http://remix.ethereum.org then compiles the contract at version 0.4.25
- After the compilation, clicks details of the smart contract to see BYTECODE and ABI of the contract.
- In HTMLCOIN wallet, routes to Smart Contracts -> Create, then copies the value of property 'object' in BYTECODE to Bytecode in HTMLCOIN wallet, and copy the whole ABI to Interface(ABI) in HTMLCOIN wallet.
- Input sender address then press Create Contract (Creating a smart contract will consume gas !!!).
- After the deployment that takes a while, it's possible to verify from the HTMLCOIN wallet -> Transations, or search the transaction hash of the contract from here: https://explorer.htmlcoin.com

### Usage
- After the deployment, copies the ContractAddress from the wallet and ABI, routes to Smart Contract -> SendTo, and input those fields accordingly.
- Converts any documents into SHA-256 from here: http://onlinemd5.com
- Select function newDoc(), Copies the result of the File checksum into the text field under the function, input Sender Address, then press Send To Contract.
