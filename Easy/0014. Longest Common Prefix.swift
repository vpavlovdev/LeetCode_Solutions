// Solution by Vladislav Pavlov
// Difficulty: Easy
// Topics: String, Trie
//
//Write a function to find the longest common prefix string amongst an array of strings.
//
//If there is no common prefix, return an empty string "".
//
// 
//
//Example 1:
//
//Input: strs = ["flower","flow","flight"]
//Output: "fl"
//Example 2:
//
//Input: strs = ["dog","racecar","car"]
//Output: ""
//Explanation: There is no common prefix among the input strings.


class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard strs.count > 1 else { return strs[0] }
        if (strs[0].first != strs[1].first) { return "" }
        var result = strs[0]
        
        for i in 0..<strs.count {
            guard !result.isEmpty else { return "" }
            for _ in 0..<result.count {
                if strs[i].hasPrefix(result) {
                    break
                } else {
                    result.removeLast()
                }
            }
        }
       
        return result
    }
}
