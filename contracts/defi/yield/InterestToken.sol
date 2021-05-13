// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Interest {
    constructor(uint256 initialSupply) ERC20("InterestCoin", "IC") {
        _mint(msg.sender, initialSupply);
    }
}