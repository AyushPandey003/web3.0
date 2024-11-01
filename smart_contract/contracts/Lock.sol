// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.27;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract Transactions{
    uint256 transactionCounter;
    event Transfer(address from,address receiver,uint amount,string message,uint256 timestamp,string keyword);

    struct TransferStruct {
        address sender;
        address receiver;
        uint amount;
        string message;
        uint256 timestamp;
        string keyword;
    }

    TransferStruct[] transactions;

    function addToBlockchain(address payable receiver, uint amount,string memory message, string memory keyword) public {
        transactionCounter+=1;
        transactions.push(TransferStruct(msg.sender,receiver,amount,message,block.timestamp,keyword));
        emit Transfer(msg.sender,receiver,amount,message,block.timestamp,keyword);
    }
    function getAllTransactions() public view returns(TransferStruct[] memory){
        return transactions;
    }

    function gettransactionsCount() public view returns(uint256){
        return transactionCounter;
    }

}