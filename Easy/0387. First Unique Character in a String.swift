// Solution by Vladislav Pavlov
// Difficulty: Easy
// Topics: Hash Table, String, Queue, Counting
//
//Given a string s, find the first non-repeating character in it and return its index. If it does not exist, return -1.
//
// 
//
//Example 1:
//
//Input: s = "leetcode"
//Output: 0
//Example 2:
//
//Input: s = "loveleetcode"
//Output: 2
//Example 3:
//
//Input: s = "aabb"
//Output: -1

class Solution {
    func firstUniqChar(_ s: String) -> Int {
        var counter = [Int](repeating: 0, count: 26)
        var aPosition = 97
        for i in s.unicodeScalars {
            counter[Int(i.value) - aPosition] += 1
        }
        
        for (i, v) in s.unicodeScalars.enumerated() {
            if counter[Int(v.value) - aPosition] == 1 { return i }
        }
        
        return -1
    }
}
