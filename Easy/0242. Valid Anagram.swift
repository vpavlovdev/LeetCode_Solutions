// Solution by Vladislav Pavlov
// Difficulty: Easy
// Topics: Hash Table, String, Sorting
//
//Given two strings s and t, return true if t is an anagram of s, and false otherwise.
//
//An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.
//
// 
//
//Example 1:
//
//Input: s = "anagram", t = "nagaram"
//Output: true
//Example 2:
//
//Input: s = "rat", t = "car"
//Output: false


class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        var sMask: [Int] = Array(repeating: 0, count: 26)
        var tMask: [Int] = Array(repeating: 0, count: 26)
        
        s.unicodeScalars.forEach { char in
            sMask[Int(char.value) - 97] += 1
        }
        
        t.unicodeScalars.forEach { char in
            tMask[Int(char.value) - 97] += 1
        }
        
        return sMask == tMask
    }
}
