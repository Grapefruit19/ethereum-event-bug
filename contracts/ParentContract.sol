pragma solidity ^0.4.18;

import "./Logger.sol";

contract ParentContract {

    Logger logger;

    uint counter = 0;
    
    event TestEvent(uint count);

    function ParentContract(address loggerAddress) {
        logger = Logger(loggerAddress);
    }

    function emitEvent() public {
        TestEvent(counter);
        // Calling another contract to log an event as well.
        logger.emitEvent(counter++);
    }
    
}
