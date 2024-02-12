// Solution by Vladislav Pavlov
// Difficulty: Easy
// Topics: Array, Math
//
//You are given a large integer represented as an integer array digits, where each digits[i] is the ith digit of the integer. The digits are ordered from most significant to least significant in left-to-right order. The large integer does not contain any leading 0's.
//
//Increment the large integer by one and return the resulting array of digits.
//
// 
//
//Example 1:
//
//Input: digits = [1,2,3]
//Output: [1,2,4]
//Explanation: The array represents the integer 123.
//Incrementing by one gives 123 + 1 = 124.
//Thus, the result should be [1,2,4].
//Example 2:
//
//Input: digits = [4,3,2,1]
//Output: [4,3,2,2]
//Explanation: The array represents the integer 4321.
//Incrementing by one gives 4321 + 1 = 4322.
//Thus, the result should be [4,3,2,2].
//Example 3:
//
//Input: digits = [9]
//Output: [1,0]
//Explanation: The array represents the integer 9.
//Incrementing by one gives 9 + 1 = 10.
//Thus, the result should be [1,0].

class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        guard digits.count > 1 else {
            var ar: [Int] = []
            ar = digits[0] == 9 ? [1, 0] : [digits[0] + 1]
            return ar
        }
        let n = digits.count - 1
        var res = digits
        var sum = 1
        
        for i in stride(from: n, through: 0, by: -1) {
            var num = res[i]
       
            if num == 9, sum == 1 {
                res[i] = 0
                sum = 1
            } else if sum == 1 {
                res[i] += sum
                if res[i] == 0 {
                    sum = 1
                } else {
                    sum = 0
                    return res
                }
            } else {
                res[i] += 1
                return res
            }
            
        }
        
        if sum == 1 { res.insert(1, at: 0) }
        return res
    }
}
