// Solution by Vladislav Pavlov
// Difficulty: Easy
// Topics: Two Pointers, String, String Matching
//
//Given two strings needle and haystack, return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.
//
// 
//
//Example 1:
//
//Input: haystack = "sadbutsad", needle = "sad"
//Output: 0
//Explanation: "sad" occurs at index 0 and 6.
//The first occurrence is at index 0, so we return 0.
//Example 2:
//
//Input: haystack = "leetcode", needle = "leeto"
//Output: -1
//Explanation: "leeto" did not occur in "leetcode", so we return -1.


class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard haystack.contains(needle) else { return -1 }
        let haystackArray = Array(haystack)
        let needleArray = Array(needle)
        
        for i in 0..<haystackArray.count {
            if haystackArray[i] == needleArray[0] {
                var res = true
                
                for j in 1..<needleArray.count {
                    guard res == true else { continue }
                    res = haystackArray[i + j] == needleArray[j]
                }
                
                if res == true {
                    return i
                }
            }
        }
        return -1
    }
}
