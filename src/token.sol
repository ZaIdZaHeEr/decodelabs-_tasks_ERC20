// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {
    ERC20
} from "lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20 {
    error Token__OnlyOwnerCanCallThisFunction();

    address public owner;
    uint256 public immutable MAX_SUPPLY;
    constructor(
        string memory _name,
        string memory _symbol,
        uint256 _maxSupply
    ) ERC20(_name, _symbol) {
        owner = msg.sender;
        MAX_SUPPLY = _maxSupply * 10 ** decimals();
    }

    function _onlyOwner() internal view {
        require(owner == msg.sender, Token__OnlyOwnerCanCallThisFunction());
    }
    modifier onlyOwner() {
        _onlyOwner();
        _;
    }

    function mint(address to, uint256 amount) public onlyOwner {
        require(totalSupply() + amount <= MAX_SUPPLY, "Max Supply Exceeded");
        _mint(to, amount);
    }
    function transferToken(address _to, uint256 _amount) public {
        transfer(_to, _amount);
    }
    function checkBalance(address _account) public view returns (uint256) {
        return balanceOf(_account);
    }
}
