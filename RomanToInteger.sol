// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RomanToInteger {
    error InvalidInt(uint256 res);

    // 将单个罗马字符转换为数值
    function charToInt(bytes1 c) internal pure returns(uint256) {
        if (c == 'I') return 1;
        if (c == 'V') return 5;
        if (c == 'X') return 10;
        if (c == 'L') return 50;
        if (c == 'C') return 100;
        if (c == 'D') return 500;
        if (c == 'M') return 1000;
        revert("Invalid Roman numeral character");
    }

    // 将罗马数字字符串转换为整数
    function romanToInt(string memory s) public pure returns(uint256) {
        bytes memory b = bytes(s);
        uint result = 0;
        uint prevValue = 0;

        // 从右往左遍历更高效（避免 lookahead）
        for (uint i = b.length; i > 0; i--) {
            uint currentValue = charToInt(b[i - 1]);
            
            // 如果当前值小于前一个值（即右边的值），则减去它（减法规则）
            if (currentValue < prevValue) {
                result -= currentValue;
            } else {
                result += currentValue;
            }
            
            prevValue = currentValue;
        }

        if (result <= 0 || result >= 4000) {
            revert InvalidInt(result);
        }

        return result;
    }
}
