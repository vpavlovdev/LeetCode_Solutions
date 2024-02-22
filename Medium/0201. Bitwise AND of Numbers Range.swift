// Solution by Vladislav Pavlov
// Difficulty: Medium
// Topics: Bit Manipulation
//
//Given two integers left and right that represent the range [left, right], return the bitwise AND of all numbers in this range, inclusive.
//
// 
//
//Example 1:
//
//Input: left = 5, right = 7
//Output: 4
//Example 2:
//
//Input: left = 0, right = 0
//Output: 0
//Example 3:
//
//Input: left = 1, right = 2147483647
//Output: 0


class Solution {
    func rangeBitwiseAnd(_ left: Int, _ right: Int) -> Int {
        var l = left
        var r = right
        var shift = 0

        while l < r {
            l >>= 1
            r >>= 1
            shift += 1
        }

        return l << shift
    }
}
