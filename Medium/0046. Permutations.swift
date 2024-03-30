// Solution by Vladislav Pavlov
// Difficulty: Medium
// Topics: Array, Backtracking
//
//Given an array nums of distinct integers, return all the possible permutations. You can return the answer in any order.
//
// 
//
//Example 1:
//Input: nums = [1,2,3]
//Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
//
//Example 2:
//Input: nums = [0,1]
//Output: [[0,1],[1,0]]
//
//Example 3:
//Input: nums = [1]
//Output: [[1]]


class Solution {
    @_optimize(speed)
    func permute(_ nums: [Int]) -> [[Int]] {
        guard !nums.isEmpty else { return [[]] }
        
        var result: [[Int]] = []
        
        func backtrack(_ path: [Int], _ input: [Int]) {
            if path.count >= nums.count { result.append(path); return }
            
            for (i, item) in input.enumerated() {
                var path = path
                var input = input
                
                path.append(item)
                input.remove(at: i)
                
                backtrack(path, input)
            }
        }
        
        backtrack([], nums)
        
        return result
    }
}
