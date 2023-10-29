// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract AnotherContract {
    address public owner;
    string public name;
    uint public age;
    uint internal balance;

    /**
     * @dev The caller account is not authorized to perform an operation.
     */
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the contract owner can call this function");
        _; // This underscore represents the function code that the modifier wraps
    }

    constructor(string memory _name, uint _age) payable {
        name = _name;
        age = _age;
        balance += msg.value;
        owner = msg.sender;
    }

    function checkBalance() public view returns (uint) {
        return balance;
    }

    function getCred() public view returns (string memory, uint) {
        return (name, age);
    }

    /**
     * @dev Send funds to contract. Only Owners are allowed
     */
    function pay() public onlyOwner payable returns (uint) {
        balance += msg.value;
        return balance;
    }
}
