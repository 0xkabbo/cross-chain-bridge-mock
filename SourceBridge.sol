// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract SourceBridge is Ownable {
    IERC20 public token;
    
    event Locked(address indexed user, uint256 amount, uint256 nonce);
    event Unlocked(address indexed user, uint256 amount, uint256 nonce);

    constructor(address _token) Ownable(msg.sender) {
        token = IERC20(_token);
    }

    function lock(uint256 amount) external {
        require(amount > 0, "Amount must be > 0");
        token.transferFrom(msg.sender, address(this), amount);
        emit Locked(msg.sender, amount, block.timestamp);
    }

    function unlock(address user, uint256 amount) external onlyOwner {
        token.transfer(user, amount);
        emit Unlocked(user, amount, block.timestamp);
    }
}
