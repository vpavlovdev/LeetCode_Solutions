// Solution by Vladislav Pavlov
// Difficulty: Easy
// Topics: Hash Table, String, Counting
//
//Given a string text, you want to use the characters of text to form as many instances of the word "balloon" as possible.
//
//You can use each character in text at most once. Return the maximum number of instances that can be formed.
//
//Example 1:
//Input: text = "nlaebolko"
//Output: 1
//
//Example 2:
//Input: text = "loonbalxballpoon"
//Output: 2
//
//Example 3:
//Input: text = "leetcode"
//Output: 0

class Solution {
    
    func maxNumberOfBalloons(_ text: String) -> Int {
        var bCounts = 0
        var aCounts = 0
        var lCounts = 0
        var oCounts = 0
        var nCounts = 0
        
        for i in text {
            switch i {
            case "b": bCounts += 1
            case "a": aCounts += 1
            case "l": lCounts += 1
            case "o": oCounts += 1
            case "n": nCounts += 1
            default: continue
            }
        }
        
        lCounts /= 2; oCounts /= 2

        return min(bCounts, aCounts, lCounts, oCounts, nCounts)
    }
    
    func maxNumberOfBalloons(_ text: String) -> Int {
            
            var map: [Character : Int] = [
                "b": 0,
                "a": 0,
                "l": 0,
                "o": 0,
                "n": 0
            ]
            map.reserveCapacity(5)
            
            for i in text {
                guard map[i] != nil else { continue }
                map[i]! += 1
            }
            
            map["l"]! /= 2
            map["o"]! /= 2
            
            return map.values.min()!
        }
}
