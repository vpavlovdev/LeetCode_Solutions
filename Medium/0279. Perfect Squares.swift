// Solution by Vladislav Pavlov
// Difficulty: Medium
// Topics: Math, Dynamic Programming, Breadth-First Search
//
//Given an integer n, return the least number of perfect square numbers that sum to n.
//
//A perfect square is an integer that is the square of an integer; in other words, it is the product of some integer with itself. For example, 1, 4, 9, and 16 are perfect squares while 3 and 11 are not.
//
// 
//
//Example 1:
//
//Input: n = 12
//Output: 3
//Explanation: 12 = 4 + 4 + 4.
//Example 2:
//
//Input: n = 13
//Output: 2
//Explanation: 13 = 4 + 9.


class Solution {
    func numSquares(_ n: Int) -> Int {
        var dp: [Int] = Array(0...n)
        
        for i in 1...n {
            var hight = 1
            
            while hight * hight <= i {
                dp[i] = min(dp[i], dp[i - hight * hight] + 1)
                hight += 1
            }
            var j = 1
        }
        
        return dp[n]
    }
}
