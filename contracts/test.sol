// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Locker {
    mapping(address => uint32) public unlockAt;

    function lock(uint256 seconds_) external {
        unlockAt[msg.sender] = uint32(block.timestamp + seconds_);
    }

    function withdraw() external view returns (bool) {
        return block.timestamp >= unlockAt[msg.sender];
    }

    function reset() external {
        unlockAt[msg.sender] = 0;
    }
}
