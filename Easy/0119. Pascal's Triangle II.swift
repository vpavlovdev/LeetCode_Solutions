// Solution by Vladislav Pavlov
// Difficulty: Easy
// Topics: Array, Dynamic Programming
//
//Given an integer rowIndex, return the rowIndexth (0-indexed) row of the Pascal's triangle.
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
//Input: rowIndex = 3
//Output: [1,3,3,1]
//Example 2:
//
//Input: rowIndex = 0
//Output: [1]
//Example 3:
//
//Input: rowIndex = 1
//Output: [1,1]


class Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
            let rows = rowIndex + 1

            guard rowIndex > 1 else {
                return [Int](Array(repeating: 1, count: rows))
            }

            var dp = [[Int]](Array(repeating: [Int](repeating: 1, count: 1), count: rows))
            
            for i in 1..<rows {
                for j in 1...i {
                    if i == j {
                        dp[i].append(1)
                    } else {
                        dp[i].append(dp[i - 1][j] + dp[i - 1][j - 1])
                    }
                }
            }
            
            return dp[rowIndex]
        }
}
