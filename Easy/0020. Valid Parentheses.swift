// Solution by Vladislav Pavlov
// Difficulty: Easy
// Topics: String, Stack
//
//Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
//
//An input string is valid if:
//
//Open brackets must be closed by the same type of brackets.
//Open brackets must be closed in the correct order.
//Every close bracket has a corresponding open bracket of the same type.
// 
//
//Example 1:
//
//Input: s = "()"
//Output: true
//Example 2:
//
//Input: s = "()[]{}"
//Output: true
//Example 3:
//
//Input: s = "(]"
//Output: false


class Solution {
    func isValid(_ s: String) -> Bool {
    var stack = [Character]()
    
    
    for char in s {
        if stack.isEmpty {
            stack.append(char)
        } else if let lastElement = stack.last {
            switch lastElement {
            case let x where x == "(" && char == ")":
                stack.removeLast()
            case let x where x == "[" && char == "]":
                stack.removeLast()
            case let x where x == "{" && char == "}":
                stack.removeLast()
            default: stack.append(char)
            }
        }
        
    }
    
    return stack.isEmpty
}
}
