// Solution by Vladislav Pavlov
// Difficulty: Medium
// Topics: Array, Dynamic Programming
//
//Given an integer array nums, find a
//subarray
// that has the largest product, and return the product.
//
//The test cases are generated so that the answer will fit in a 32-bit integer.
//
// 
//
//Example 1:
//
//Input: nums = [2,3,-2,4]
//Output: 6
//Explanation: [2,3] has the largest product 6.
//Example 2:
//
//Input: nums = [-2,0,-1]
//Output: 0
//Explanation: The result cannot be 2, because [-2,-1] is not a subarray.


class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        let n = nums.count
        guard n > 1 else { return nums[0] }
        let full = nums.reduce(1, *)
        if full > 0 { return full }
        
        var dp: [Int] = nums
        var res = 0
        
        for i in 0..<n {
            for j in i + 1..<n {
                let v = dp[i] * nums[j]
                guard v != 0 else {
                    dp[i] = max(v, dp[i])
                    break }
                    res = max(res, v)
                    dp[i] = v
            }
        }
       
        return min(Int(Int32.max), max(res, nums.max()!))
    }
}
