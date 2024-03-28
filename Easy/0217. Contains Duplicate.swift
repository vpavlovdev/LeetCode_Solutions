// Solution by Vladislav Pavlov
// Difficulty: Easy
// Topics: Array, Hash Table, Sorting
//
//Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.
//
//Example 1:
//Input: nums = [1,2,3,1]
//Output: true
//                                                
//Example 2:
//Input: nums = [1,2,3,4]
//Output: false
//                                                
//Example 3:
//Input: nums = [1,1,1,3,3,4,3,2,4,2]
//Output: true


class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var map = nums.reduce(into: [:]) { map, num in
            map[num, default: 0] += 1
        }
        
        for i in map.values where i > 1{
            return true
        }
        
        return false
    }
}
