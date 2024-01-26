// Solution by Vladislav Pavlov
// Difficulty: Medium
// Topics: String, Dynamic Programming
//
//Given two strings text1 and text2, return the length of their longest common subsequence. If there is no common subsequence, return 0.
//
//A subsequence of a string is a new string generated from the original string with some characters (can be none) deleted without changing the relative order of the remaining characters.
//
//For example, "ace" is a subsequence of "abcde".
//A common subsequence of two strings is a subsequence that is common to both strings.
//
// 
//
//Example 1:
//
//Input: text1 = "abcde", text2 = "ace"
//Output: 3
//Explanation: The longest common subsequence is "ace" and its length is 3.
//Example 2:
//
//Input: text1 = "abc", text2 = "abc"
//Output: 3
//Explanation: The longest common subsequence is "abc" and its length is 3.
//Example 3:
//
//Input: text1 = "abc", text2 = "def"
//Output: 0
//Explanation: There is no such common subsequence, so the result is 0.

class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        
        guard text1 != text2 else { return text1.count }
        
        let text1Ar = Array(text1)
        let text2Ar = Array(text2)
        var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: text2.count + 1), count: text1.count + 1)
        
        for i in 1...text1Ar.count {
            for j in 1...text2Ar.count {
                if text1Ar[i - 1] == text2Ar[j - 1] {
                    dp[i][j] = dp[i - 1][j - 1] + 1
                } else {
                    dp[i][j] = max(dp[i][j - 1], dp[i - 1][j])
                }
            }
        }
        return dp.last?.last ?? 0
    }
}
