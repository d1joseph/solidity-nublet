// SPDX-License-Identifier: GPL-3.0;
pragma solidity  ^0.8.4;


// @title HelloWorld
// @author Dhiv Joseph
/* Contract description - a 'hello world-esque' contract that takes
primitive state variables and performs some basic operations to create some complex types 
representing a custom hello world message. We'll use some basic control flow, index acessing 
and string concats to write a customised hello world.
*/

contract HelloWorld {
    
    // state variable
    address public owner = msg.sender;
    string public latestReply;
    
    
    // public function
    function helloWorld() public pure returns(string memory message){
        
        // containing a local variable
        message = "Hello, world. Is it me you're looking for...?";
    }
    
    // exposes a state variable
    function leaveReply(string memory _your_reply_msg) public {
        
        // accessing and changing state
        latestReply = _your_reply_msg;
    }

}