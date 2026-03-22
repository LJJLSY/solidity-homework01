// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IntegerToRoman {
    function intToRoman(uint256 num) public pure returns(string memory) {
        require(num > 0 && num < 4000, "Number out of range (1-3999)");

        // 声明查找表
        string[] memory THOUSANDS = new string[](4);
        THOUSANDS[0] = "";
        THOUSANDS[1] = "M";
        THOUSANDS[2] = "MM";
        THOUSANDS[3] = "MMM";

        string[] memory HUNDREDS = new string[](10);
        HUNDREDS[0] = "";
        HUNDREDS[1] = "C";
        HUNDREDS[2] = "CC";
        HUNDREDS[3] = "CCC";
        HUNDREDS[4] = "CD";
        HUNDREDS[5] = "D";
        HUNDREDS[6] = "DC";
        HUNDREDS[7] = "DCC";
        HUNDREDS[8] = "DCCC";
        HUNDREDS[9] = "CM";

        string[] memory TENS = new string[](10);
        TENS[0] = "";
        TENS[1] = "X";
        TENS[2] = "XX";
        TENS[3] = "XXX";
        TENS[4] = "XL";
        TENS[5] = "L";
        TENS[6] = "LX";
        TENS[7] = "LXX";
        TENS[8] = "LXXX";
        TENS[9] = "XC";

        string[] memory ONES = new string[](10);
        ONES[0] = "";
        ONES[1] = "I";
        ONES[2] = "II";
        ONES[3] = "III";
        ONES[4] = "IV";
        ONES[5] = "V";
        ONES[6] = "VI";
        ONES[7] = "VII";
        ONES[8] = "VIII";
        ONES[9] = "IX";

        //拆解数字并查表
        uint8 thousandsIndex = uint8(num / 1000);            // 千位
        uint8 hundredsIndex = uint8((num % 1000) / 100);     // 百位
        uint8 tensIndex = uint8((num % 100) / 10);           // 十位
        uint8 onesIndex = uint8(num % 10);                   // 个位

        // 拼接字符串
        return string(
            abi.encodePacked
            (
                THOUSANDS[thousandsIndex],
                HUNDREDS[hundredsIndex],
                TENS[tensIndex],
                ONES[onesIndex]
            )
        );
    }
}
