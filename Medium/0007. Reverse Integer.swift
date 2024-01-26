// Solution by Vladislav Pavlov
// Difficulty: Medium
// Topics: Math
//
//Given a signed 32-bit integer x, return x with its digits reversed. If reversing x causes the value to go outside the signed 32-bit integer range [-231, 231 - 1], then return 0.
//
//Assume the environment does not allow you to store 64-bit integers (signed or unsigned).
//
// 
//
//Example 1:
//
//Input: x = 123
//Output: 321
//Example 2:
//
//Input: x = -123
//Output: -321
//Example 3:
//
//Input: x = 120
//Output: 21


class Solution {
    func reverse(_ x: Int) -> Int {
        guard x != 0 else { return 0}
        let string = Array(String(abs(x)))
        var result = ""
        
        for i in stride(from: string.count - 1, through: 0, by: -1) {
            if string[i] == "0" && result.isEmpty {
                continue
            } else {
                result.append(string[i])
            }
        }
        
        var returned = x > 0 ? Int(result)! : -Int(result)!
        let range = Int(Int32.min)..<Int(Int32.max)
        return range.contains(returned) ? returned : 0
    }
}
