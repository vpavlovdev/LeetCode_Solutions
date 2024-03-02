// Solution by Vladislav Pavlov
// Difficulty: Easy
// Topics: Array, Two Pointers, Sorting
//
//Given an integer array nums sorted in non-decreasing order, return an array of the squares of each number sorted in non-decreasing order.
//
// 
//
//Example 1:
//
//Input: nums = [-4,-1,0,3,10]
//Output: [0,1,9,16,100]
//Explanation: After squaring, the array becomes [16,1,0,9,100].
//After sorting, it becomes [0,1,9,16,100].
//Example 2:
//
//Input: nums = [-7,-3,2,3,11]
//Output: [4,9,9,49,121]


extension Int {

    var square: Int {
        self * self
    }
}
class Solution {

    func sortedSquares(_ nums: [Int]) -> [Int] {
        var l = 0, r = nums.count - 1
        var result = nums
        
        for i in stride(from: nums.count - 1, through: 0, by: -1) {
            if abs(nums[l]) < abs(nums[r]) {
                result[i] = nums[r].square
                r -= 1
            } else {
                result[i] = nums[l].square
                l += 1
            }
        }
        
        return result
    }
}
