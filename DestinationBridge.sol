// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DestinationToken is ERC20, Ownable {
    constructor() ERC20("Wrapped Asset", "W-AST") Ownable(msg.sender) {}

    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }

    function burn(address from, uint256 amount) external onlyOwner {
        _burn(from, amount);
    }
}

contract DestinationBridge is Ownable {
    DestinationToken public token;

    event Minted(address indexed user, uint256 amount);
    event Burned(address indexed user, uint256 amount);

    constructor(address _token) Ownable(msg.sender) {
        token = DestinationToken(_token);
    }

    function mintOnDestination(address user, uint256 amount) external onlyOwner {
        token.mint(user, amount);
        emit Minted(user, amount);
    }

    function burnFromDestination(uint256 amount) external {
        token.burn(msg.sender, amount);
        emit Burned(msg.sender, amount);
    }
}
