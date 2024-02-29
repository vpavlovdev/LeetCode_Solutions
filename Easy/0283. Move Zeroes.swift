// Solution by Vladislav Pavlov
// Difficulty: Easy
// Topics: Array, Two Pointers
//
//Given an integer array nums, move all 0's to the end of it while maintaining the relative order of the non-zero elements.
//
//Note that you must do this in-place without making a copy of the array.
//
// 
//
//Example 1:
//
//Input: nums = [0,1,0,3,12]
//Output: [1,3,12,0,0]
//Example 2:
//
//Input: nums = [0]
//Output: [0]

class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var newArray: [Int] = Array(repeating: 0, count: nums.count)
        var index = 0
        
        for i in nums {
            if i != 0 {
                newArray[index] = i
                index += 1
            }
        }
        
        nums = newArray
    }
}
