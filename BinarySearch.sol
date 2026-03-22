// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BinarySearch {
    function search(uint256[] memory arr, uint target) public pure returns(uint256) {
        require(arr.length > 0, "The array cannot be empty");
        uint256 len = arr.length;
        uint256 left = 0;
        uint256 right = len - 1;

        while (left <= right) {
            uint256 mid = left + (right - left) / 2;
            uint256 val = arr[mid];

            if (val == target) {
                return mid;
            } else if (val < target) {
                left = mid + 1;
            } else {
                if (mid == 0) break;
                right = mid - 1;
            }
        }

        return type(uint256).max;
    }
}
