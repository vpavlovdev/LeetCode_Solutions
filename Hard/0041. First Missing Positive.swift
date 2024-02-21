// Solution by Vladislav Pavlov
// Difficulty: Hard
// Topics: Array, Hash Table
//
//Given an unsorted integer array nums, return the smallest missing positive integer.
//
//You must implement an algorithm that runs in O(n) time and uses O(1) auxiliary space.
//
// 
//
//Example 1:
//
//Input: nums = [1,2,0]
//Output: 3
//Explanation: The numbers in the range [1,2] are all in the array.
//Example 2:
//
//Input: nums = [3,4,-1,1]
//Output: 2
//Explanation: 1 is in the array but 2 is missing.
//Example 3:
//
//Input: nums = [7,8,9,11,12]
//Output: 1
//Explanation: The smallest positive integer 1 is missing.


class Solution {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        var n = nums
        var c = nums.count

        for i in 0..<c {
            if n[i] <= 0 {
                n[i] = c + 1
            }
        }
        for i in 0..<c {
            let num = abs(n[i])
            if num <= c {
                n[num - 1] = -abs(n[num - 1])
            }
        }
        for i in 0..<c {
            if n[i] > 0 {
                return i + 1
            }
        }

        return c + 1
    }
}
