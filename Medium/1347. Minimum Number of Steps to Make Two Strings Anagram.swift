// Solution by Vladislav Pavlov
// Difficulty: Medium
// Topics: Hash Table, String, Counting
//
//You are given two strings of the same length s and t. In one step you can choose any character of t and replace it with another character.
//
//Return the minimum number of steps to make t an anagram of s.
//
//An Anagram of a string is a string that contains the same characters with a different (or the same) ordering.
//
//Example 1:
//
//Input: s = "bab", t = "aba"
//Output: 1
//Explanation: Replace the first 'a' in t with b, t = "bba" which is anagram of s.
//Example 2:
//
//Input: s = "leetcode", t = "practice"
//Output: 5
//Explanation: Replace 'p', 'r', 'a', 'i' and 'c' from t with proper characters to make t anagram of s.
//Example 3:
//
//Input: s = "anagram", t = "mangaar"
//Output: 0
//Explanation: "anagram" and "mangaar" are anagrams.

class Solution {
        func minSteps(_ s: String, _ t: String) -> Int {
        var counter1 = [Int](repeating: 0, count: 26)
        var counter2 = [Int](repeating: 0, count: 26)
        var aPosition = 97
        var steps = 0
        
        for char in s.unicodeScalars {
            var pos = Int(char.value) - aPosition
            counter1[pos] += 1
        }
        
        for char in t.unicodeScalars {
            var pos = Int(char.value) - aPosition
            counter2[pos] += 1
        }
        
        var j = 0
        
        while j < counter1.count {
            if !(counter1[j] == counter2[j]) && (counter1[j] > counter2[j]) {
                steps += counter1[j] - counter2[j]
            }
            j += 1
        }
        
        return steps
    }
}
