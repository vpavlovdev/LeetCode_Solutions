// Solution by Vladislav Pavlov
// Difficulty: Easy
// Topics: String
//
//Given a string s consisting of words and spaces, return the length of the last word in the string.
//
//A word is a maximal
//substring
// consisting of non-space characters only.
//
// 
//
//Example 1:
//
//Input: s = "Hello World"
//Output: 5
//Explanation: The last word is "World" with length 5.
//Example 2:
//
//Input: s = "   fly me   to   the moon  "
//Output: 4
//Explanation: The last word is "moon" with length 4.
//Example 3:
//
//Input: s = "luffy is still joyboy"
//Output: 6
//Explanation: The last word is "joyboy" with length 6.

class Solution {
    func lengthOfLastWord(_ s: String) -> Int {
        guard s.contains(" ") else { return s.count }
        var l = 0
        
        for i in s.reversed() {
            switch i {
            case " " where l > 0 :
                return l
            case " ": continue
            default:
                l += 1
            }
        }

        return l
    }
}
