// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

contract InkSpot {
    // State variables
    uint public inkBalance; // Stores the balance of Ink credits
    address public inkCreator; // The creator of the Ink contract
    
    // Constructor
    constructor() {
        inkCreator = msg.sender; // Correct assignment
    }

    // Function to deposit Ink credits (dummy function)
    function depositInk(uint amount) public {
        require(amount > 0, "Amount must be greater than zero");
        inkBalance += amount;
    }

    // Function to set custom inkMessage
    function setInkMessage(string memory inkMessage) public pure returns (string memory) {
        return string(abi.encodePacked("Welcome to the Inkverse!", inkMessage)); // Correct concatenation
    }

    // Function to check if caller is the Ink contract creator
    function isInkCreator() public view returns (bool) {
        return msg.sender == inkCreator; // Correct comparison
    }

    // Fallback function
    fallback() external payable {
        revert("Ink fallback triggered"); // Missing parenthesis added
    }

    // Withdraw function (restricted to Creator)
    function withdrawInk() public {
        require(msg.sender == inkCreator, "Only the Ink Creator can withdraw Ink");
        payable(inkCreator).transfer(address(this).balance); // send replaced by transfer
    }

    // Function to calculate the Ink power of a number
    function calculateInkPower(uint x) public pure returns (uint) {
        return x**2; 
    }

    // Function to compare two Ink identifiers
    function compareInkIds(string memory id1, string memory id2) public pure returns (bool) {
        return keccak256(abi.encodePacked(id1)) == keccak256(abi.encodePacked(id2)); 
    }

    receive() external payable {
    }
} 