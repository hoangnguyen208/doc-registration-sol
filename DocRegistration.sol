pragma solidity ^0.4.20;

contract DocRegistration {
    address owner;
    
    struct Doc {
        bool stored;
        uint blockNumber;
        uint blockTimestamp;
        address sender;
    }
    
    mapping(bytes32 => Doc) internal docs;
    
    event DocEvent(uint blockNumber, bytes32 hash);
    
    constructor() public {
        owner = msg.sender;
    }
    
    function empty() public {
        owner.transfer(owner.balance);
    }
    
    function addDoc(bytes32 hash) internal {
        docs[hash].stored = true;
        docs[hash].blockNumber = block.number;
        docs[hash].blockTimestamp = block.timestamp;
        docs[hash].sender = msg.sender;
    }
    
    function stringToBytes32(string memory source) internal returns (bytes32 result) {
        bytes memory tempEmptyStringTest = bytes(source);
        if (tempEmptyStringTest.length == 0) {
            return 0x0;
        }
    
        assembly {
            result := mload(add(source, 32))
        }
    }
    
    function newDoc(string inputSha256) external returns(bool isSucceeded) {
        bytes32 hash = stringToBytes32(inputSha256);
        if(docs[hash].stored) {
            isSucceeded = false;
        }
        else {
            addDoc(hash);
            emit DocEvent(docs[hash].blockNumber, hash);
            isSucceeded = true;
        }
        return isSucceeded;
    }
    
    function getDoc(string inputSha256) external view returns(uint blockNumber, uint blockTimestamp, address sender) {
        bytes32 hash = stringToBytes32(inputSha256);
        require(docs[hash].stored);
        return(docs[hash].blockNumber, docs[hash].blockTimestamp, docs[hash].sender);
    }
}