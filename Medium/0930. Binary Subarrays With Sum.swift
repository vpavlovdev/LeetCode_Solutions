// Solution by Vladislav Pavlov
// Difficulty: Medium
// Topics: Array, Hash Table, Sliding Window, Prefix Sum
//
//Given a binary array nums and an integer goal, return the number of non-empty subarrays with a sum goal.
//
//A subarray is a contiguous part of the array.
//
// 
//
//Example 1:
//
//Input: nums = [1,0,1,0,1], goal = 2
//Output: 4
//Explanation: The 4 subarrays are bolded and underlined below:
//[1,0,1,0,1]
//[1,0,1,0,1]
//[1,0,1,0,1]
//[1,0,1,0,1]
//Example 2:
//
//Input: nums = [0,0,0,0,0], goal = 0
//Output: 15

class Solution {
    func numSubarraysWithSum(_ nums: [Int], _ goal: Int) -> Int {
        var res = 0
        var ind = [-1]

        for i in 0..<nums.count where nums[i] == 1 { ind.append(i) }
        ind.append(nums.count)

        if goal == 0 {
            var res = 0
            for i in 0..<(ind.count - 1) {
                let count = ind[i + 1] - ind[i] - 1
                res += (count + 1) * count / 2
            }
            return res
        }

        for i in 0..<(ind.count - goal - 1) {
            let r = i + goal
            res += (ind[i + 1] - ind[i]) * (ind[r + 1] - ind[r])
        }
        
        return res
    }
}
