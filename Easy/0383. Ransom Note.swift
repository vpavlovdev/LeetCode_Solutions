// Solution by Vladislav Pavlov
// Difficulty: Easy
// Topics: Hash Table, String, Counting
//
//Given two strings ransomNote and magazine, return true if ransomNote can be constructed by using the letters from magazine and false otherwise.
//
//Each letter in magazine can only be used once in ransomNote.
//
// 
//
//Example 1:
//
//Input: ransomNote = "a", magazine = "b"
//Output: false
//Example 2:
//
//Input: ransomNote = "aa", magazine = "ab"
//Output: false
//Example 3:
//
//Input: ransomNote = "aa", magazine = "aab"
//Output: true


class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        var counter1: [Int] = Array(repeating: 0, count: 26)
        var counter2: [Int] = Array(repeating: 0, count: 26)
        let aPos = 97
        
        for i in ransomNote.unicodeScalars {
            counter1[Int(i.value) - aPos] += 1
        }
        
        for j in magazine.unicodeScalars {
            counter2[Int(j.value) - aPos] += 1
        }
        
        for k in 0..<counter1.count where counter1[k] != 0 {
            if counter1[k] > counter2[k] { return false }
        }
        
        return true
    }
}
