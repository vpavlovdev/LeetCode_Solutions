// Solution by Vladislav Pavlov
// Difficulty: Easy
// Topics: Array, Dynamic Programming
//
//Given an integer numRows, return the first numRows of Pascal's triangle.
//
//In Pascal's triangle, each number is the sum of the two numbers directly above it as shown:
//        [1]
//       [1,1]
//      [1,2,1]
//     [1,3,3,1]
//    [1,4,6,4,1]
//
//Example 1:
//
//Input: numRows = 5
//Output: [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]
//Example 2:
//
//Input: numRows = 1
//Output: [[1]]


class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        guard numRows > 1 else { return [[1]] }
        var dp = [[Int]](repeating: [Int](repeating: 1, count: 1), count: numRows)
        
        for i in 1..<numRows {
            for j in 1...i {
                if j == i { dp[i].append(1)
                } else {
                    let value = dp[i - 1][j] + dp[i - 1][j - 1]
                    dp[i].append(value)
                }
            }
        }
        return dp
    }
}
