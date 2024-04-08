// Solution by Vladislav Pavlov
// Difficulty: Easy
// Topics: String, Stack
//
//Given a string s of lower and upper case English letters.
//
//A good string is a string which doesn't have two adjacent characters s[i] and s[i + 1] where:
//
//0 <= i <= s.length - 2
//s[i] is a lower-case letter and s[i + 1] is the same letter but in upper-case or vice-versa.
//To make the string good, you can choose two adjacent characters that make the string bad and remove them. You can keep doing this until the string becomes good.
//
//Return the string after making it good. The answer is guaranteed to be unique under the given constraints.
//
//Notice that an empty string is also good.
//
// 
//
//Example 1:
//
//Input: s = "leEeetcode"
//Output: "leetcode"
//Explanation: In the first step, either you choose i = 1 or i = 2, both will result "leEeetcode" to be reduced to "leetcode".
//Example 2:
//
//Input: s = "abBAcC"
//Output: ""
//Explanation: We have many possible scenarios, and all lead to the same answer. For example:
//"abBAcC" --> "aAcC" --> "cC" --> ""
//"abBAcC" --> "abBA" --> "aA" --> ""
//Example 3:
//
//Input: s = "s"
//Output: "s"


class Solution {
    @_optimize(speed)
    func makeGood(_ s: String) -> String {
        guard !s.isEmpty else { return "" }
        
        var stack: [Character] = []
        
        for i in s {
            if !stack.isEmpty && asciiValueDifference(stack.last!, i) {
                stack.removeLast()
            } else {
                stack.append(i)
            }
        }
        
        func asciiValueDifference(_ char1: Character, _ char2: Character) -> Bool {
            let asciiValue1 = char1.asciiValue ?? 0
            let asciiValue2 = char2.asciiValue ?? 0
            return abs(Int(asciiValue1) - Int(asciiValue2)) == 32
            
        }
        
        return String(stack)
    }
}
