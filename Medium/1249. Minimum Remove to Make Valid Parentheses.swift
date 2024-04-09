// Solution by Vladislav Pavlov
// Difficulty: Medium
// Topics: String, Stack
//
//Given a string s of '(' , ')' and lowercase English characters.
//
//Your task is to remove the minimum number of parentheses ( '(' or ')', in any positions ) so that the resulting parentheses string is valid and return any valid string.
//
//Formally, a parentheses string is valid if and only if:
//
//It is the empty string, contains only lowercase characters, or
//It can be written as AB (A concatenated with B), where A and B are valid strings, or
//It can be written as (A), where A is a valid string.
// 
//Example 1:
//Input: s = "lee(t(c)o)de)"
//Output: "lee(t(c)o)de"
//Explanation: "lee(t(co)de)" , "lee(t(c)ode)" would also be accepted.
//                                            
//Example 2:
//Input: s = "a)b(c)d"
//Output: "ab(c)d"
//                                            
//Example 3:
//Input: s = "))(("
//Output: ""
//Explanation: An empty string is also valid.


class Solution {
    @_optimize(speed)
    func minRemoveToMakeValid(_ s: String) -> String {
        var array = Array(s)
        var stack = [(index: Int, bracket: Character)]()
        
        for i in array.indices where array[i] == "(" || array[i] == ")" {
            guard let lastElement = stack.last else {
                stack.append((index: i, bracket: array[i]))
                continue
            }
            
                switch lastElement {
                case let x where x.bracket == "(" && array[i] == ")":
                    stack.removeLast()
                default:
                    stack.append((index: i, bracket: array[i]))
                    
                }
        }
        
        var res: String = ""
        
        for j in array.indices where !stack.contains(where: { i, _ in i == j }) {
            res.append(array[j])
        }
        
        return res
    }
}
