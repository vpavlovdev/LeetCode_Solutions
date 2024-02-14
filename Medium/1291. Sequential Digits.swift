// Solution by Vladislav Pavlov
// Difficulty: Medium
// Topics: Enumeration
//
//An integer has sequential digits if and only if each digit in the number is one more than the previous digit.
//
//Return a sorted list of all the integers in the range [low, high] inclusive that have sequential digits.
//
// 
//
//Example 1:
//
//Input: low = 100, high = 300
//Output: [123,234]
//Example 2:
//
//Input: low = 1000, high = 13000
//Output: [1234,2345,3456,4567,5678,6789,12345]

class Solution {
    func sequentialDigits(_ low: Int, _ high: Int) -> [Int] {
        var possibleAnswers: [Int] = [
            12,23,34,45,56,67,78,89,123,234,345,456,567,678,789,
            1234,2345,3456,4567,5678,6789,12345,23456,34567,45678,
            56789,123456,234567,345678,456789,1234567,2345678,3456789,
            12345678,23456789,123456789
        ]
        var res: [Int] = []
        let valueRange = low...high
        
        for i in possibleAnswers where valueRange.contains(i) {
            res.append(i)
        }
        
        return res
    }
}
