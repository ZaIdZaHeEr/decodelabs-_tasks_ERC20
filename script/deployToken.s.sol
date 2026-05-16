// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Token} from "../src/token.sol";
import {Script} from "lib/forge-std/src/Script.sol";

contract DeployToken is Script {
    function run() external {
        new Token("TOKENZ", "TKZ", 1000);
    }
}
