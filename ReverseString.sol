// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ReverseString {
    function reverse(string memory input) public pure returns(string memory) {
        require(bytes(input).length > 0, "The string cannot be empty");
        require(bytes(input).length <= 100, "String length too large");
        bytes memory strBytes = bytes(input);
        bytes memory reverseBytes = new bytes(strBytes.length);

        for (uint i = strBytes.length; i > 0;) {
            reverseBytes[strBytes.length - i] = strBytes[i - 1];
            unchecked{
                i--;
            }
        }

        return string(reverseBytes);
    } 
}
