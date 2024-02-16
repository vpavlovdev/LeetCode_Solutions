// Solution by Vladislav Pavlov
// Difficulty: Easy
// Topics: Array, Math, Greedy, Sorting
//
// Given an integer array nums, return the largest perimeter of a triangle with a non-zero area,
// formed from three of these lengths. If it is impossible to form any triangle of a non-zero area, return 0.


// Example 1:

// Input: nums = [2,1,2]
// Output: 5
// Explanation: You can form a triangle with three side lengths: 1, 2, and 2.
// Example 2:

// Input: nums = [1,2,1,10]
// Output: 0
// Explanation: 
// You cannot use the side lengths 1, 1, and 2 to form a triangle.
// You cannot use the side lengths 1, 1, and 10 to form a triangle.
// You cannot use the side lengths 1, 2, and 10 to form a triangle.
// As we cannot use any three side lengths to form a triangle of non-zero area, we return 0.

class Solution {
    func largestPerimeter(_ nums: [Int]) -> Int {
        var arr = nums.sorted()
        var p = 0
        
        for i in stride(from: arr.count - 1, through: 0, by: -1) where i - 2 >= 0 {
            let num = arr[i - 1] + arr[i - 2]
            let cur = arr[i]
            
            if num > cur {
                p = max(p, num + cur)
            } else {
                continue
            }
        }
        
        return p
    }
}
