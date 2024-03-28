// Solution by Vladislav Pavlov
// Difficulty: Easy
// Topics: Array, Hash Table, Sliding Window
//
//Given an integer array nums and an integer k, return true if there are two distinct indices i and j in the array such that nums[i] == nums[j] and abs(i - j) <= k.
//
//Example 1:
//Input: nums = [1,2,3,1], k = 3
//Output: true
//                                                                
//Example 2:
//Input: nums = [1,0,1,1], k = 1
//Output: true
//                                                                
//Example 3:
//Input: nums = [1,2,3,1,2,3], k = 2
//Output: false

class Solution {
    @_optimize(speed)
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        var map: [Int: [Int]] = [:]
        
        for i in nums.indices {
            let val = nums[i]
            
            guard let indices = map[val] else {
                map[val, default: []].append(i)
                continue
            }
            
            for j in indices {
                if abs(i - j) <= k {
                    return true
                }
            }
            
            map[val]?.append(i)
        }
        
        return false
    }
}
