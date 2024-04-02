// Solution by Vladislav Pavlov
// Difficulty: Easy
// Topics: Hash Table, String
//
//Given two strings s and t, determine if they are isomorphic.
//
//Two strings s and t are isomorphic if the characters in s can be replaced to get t.
//
//All occurrences of a character must be replaced with another character while preserving the order of characters. No two characters may map to the same character, but a character may map to itself.
//
//Example 1:
//
//Input: s = "egg", t = "add"
//Output: true
//Example 2:
//
//Input: s = "foo", t = "bar"
//Output: false
//Example 3:
//
//Input: s = "paper", t = "title"
//Output: true


class Solution {
    @_optimize(speed)
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false }
        
        var sCounter = [Character: [Int]]()
        sCounter.reserveCapacity(s.count)
        
        var tCounter = [Character: [Int]]()
        tCounter.reserveCapacity(t.count)
        
        for (i, v) in Array(s).enumerated() {
            sCounter[v, default: []].append(i)
        }
        
        for (i, v) in Array(t).enumerated() {
            tCounter[v, default: []].append(i)
        }
        
        for i in sCounter.values {
            
            for (key, value) in tCounter where value == i {
                tCounter[key] = nil
                break
            }
        }
        
        return tCounter.isEmpty
    }
}
