// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/Vectorized/solady/blob/main/src/utils/LibSort.sol";

contract MergeArray {
    using LibSort for uint256[];

    function merge(uint256[] memory arrayA, uint256[] memory arrayB) public pure returns(uint256[] memory) {
        uint256 lenA = arrayA.length;
        uint256 lenB = arrayB.length;
        uint256 total = arrayA.length + arrayB.length;
        uint256[] memory newArray = new uint256[](total);

        for (uint i = 0; i < lenA; i++) {
            newArray[i] = arrayA[i];
        }

        for (uint i = 0; i < lenB; i++) {
            newArray[lenA + i] = arrayB[i];
        }

        newArray.sort();
        return newArray;
    }
}
