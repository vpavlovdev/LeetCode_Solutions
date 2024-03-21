// Solution by Vladislav Pavlov
// Difficulty: Medium
// Topics: Array, Hash Table, Prefix Sum
//
//Given a binary array nums, return the maximum length of a contiguous subarray with an equal number of 0 and 1.
//
// 
//
//Example 1:
//
//Input: nums = [0,1]
//Output: 2
//Explanation: [0, 1] is the longest contiguous subarray with an equal number of 0 and 1.
//Example 2:
//
//Input: nums = [0,1,0]
//Output: 2
//Explanation: [0, 1] (or [1, 0]) is a longest contiguous subarray with equal number of 0 and 1.


class Solution {
     func findMaxLength(_ nums: [Int]) -> Int {
            guard nums.count > 0 else { return 0 }
            var maxLen = 0, count = 0
            var dict = [Int: Int]()
            dict.reserveCapacity(nums.count)
            dict[0] = -1

            for i in 0..<nums.count {
                count += nums[i] == 1 ? 1 : -1
                if let temp = dict[count] {
                    maxLen = max(maxLen, i - temp)
                } else {
                    dict[count] = i
                }
            }
            
            return maxLen
        }
}
