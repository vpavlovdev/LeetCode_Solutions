// Solution by Vladislav Pavlov
// Difficulty: Medium
// Topics: String, Dynamic Programming, Stack, Greedy
//
//Given a string s containing only three types of characters: '(', ')' and '*', return true if s is valid.
//
//The following rules define a valid string:
//
//Any left parenthesis '(' must have a corresponding right parenthesis ')'.
//Any right parenthesis ')' must have a corresponding left parenthesis '('.
//Left parenthesis '(' must go before the corresponding right parenthesis ')'.
//'*' could be treated as a single right parenthesis ')' or a single left parenthesis '(' or an empty string "".
// 
//Example 1:
//Input: s = "()"
//Output: true
//                                                                                
//Example 2:
//Input: s = "(*)"
//Output: true
//                                                                                    
//Example 3:
//Input: s = "(*))"
//Output: true


class Solution {
    @_optimize(speed)
    func checkValidString(_ s: String) -> Bool {
        var (open, close) = (0, 0)
        
        for c in s {
            open += c == "(" ? 1 : -1
            close += c != ")" ? 1 : -1

            guard close >= 0 else { return false }
            
            open = max(open, 0)
        }
        
        return open == 0
    }
}
