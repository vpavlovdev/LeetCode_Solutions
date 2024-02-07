// Solution by Vladislav Pavlov
// Difficulty: Medium
// Topics: Array, Hash Table, String, Sorting
//
//Given an array of strings strs, group the anagrams together. You can return the answer in any order.
//
//An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.
//
// 
//
//Example 1:
//
//Input: strs = ["eat","tea","tan","ate","nat","bat"]
//Output: [["bat"],["nat","tan"],["ate","eat","tea"]]
//Example 2:
//
//Input: strs = [""]
//Output: [[""]]
//Example 3:
//
//Input: strs = ["a"]
//Output: [["a"]]


extension Dictionary {
    var valuesToArray: [Value] {
        Array(self.values)
    }
}

class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        let mask: [Int] = Array(repeating: 0, count: 26)
        let aPosition = 97
        
        var map: [[Int]: [String]] = strs.reduce(into: [:]) { partialResult, str in
            var ar = mask
            str.unicodeScalars.forEach { u in
                let pos = Int(u.value) - aPosition
                ar[pos] += 1
            }
            partialResult[ar, default: []].append(str)
        }
        
        return map.valuesToArray
    }
}
