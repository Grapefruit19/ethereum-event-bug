pragma solidity ^0.4.18;

contract Logger {
    
    event TestEvent(uint count);

    function emitEvent(uint input) public {
        TestEvent(input);
    }
    
}
