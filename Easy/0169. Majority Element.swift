// Solution by Vladislav Pavlov
// Difficulty: Easy
// Topics: Array, Hash Table, Divide and Conquer, Sorting, Counting
//
//Given an array nums of size n, return the majority element.
//
//The majority element is the element that appears more than ⌊n / 2⌋ times. You may assume that the majority element always exists in the array.
//
// 
//
//Example 1:
//
//Input: nums = [3,2,3]
//Output: 3
//Example 2:
//
//Input: nums = [2,2,1,1,1,2,2]
//Output: 2

class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        guard nums.count > 2 else { return nums[0] }
        var res = nums[0]
        var _: [Int: Int] = nums.reduce(into: [:]) { partialResult, num in
            partialResult[num, default: 0] += 1
            res = partialResult[res]! > partialResult[num]! ? res : num
        }
        
        return res
    }
}
