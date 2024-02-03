// Solution by Vladislav Pavlov
// Difficulty: Easy
// Topics: Two Pointers, String, Dynamic Programming
//
//Given two strings s and t, return true if s is a subsequence of t, or false otherwise.
//
//A subsequence of a string is a new string that is formed from the original string by deleting some (can be none) of the characters without disturbing the relative positions of the remaining characters. (i.e., "ace" is a subsequence of "abcde" while "aec" is not).
//
// 
//
//Example 1:
//
//Input: s = "abc", t = "ahbgdc"
//Output: true
//Example 2:
//
//Input: s = "axc", t = "ahbgdc"
//Output: false

class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        guard s != t else { return true }
        
        var rev = Array(s.reversed())
        for i in t {
            guard !rev.isEmpty else { return true }
            if i == rev.last! { rev.removeLast() }
        }
        
        return rev.isEmpty
    }
}
