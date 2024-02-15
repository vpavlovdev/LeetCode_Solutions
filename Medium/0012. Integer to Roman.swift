// Solution by Vladislav Pavlov
// Difficulty: Medium
// Topics: Hash Table, Math, String
//
//Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.
//
//Symbol       Value
//I             1
//V             5
//X             10
//L             50
//C             100
//D             500
//M             1000
//For example, 2 is written as II in Roman numeral, just two one's added together. 12 is written as XII, which is simply X + II. The number 27 is written as XXVII, which is XX + V + II.
//
//Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:
//
//I can be placed before V (5) and X (10) to make 4 and 9.
//X can be placed before L (50) and C (100) to make 40 and 90.
//C can be placed before D (500) and M (1000) to make 400 and 900.
//Given an integer, convert it to a roman numeral.
//
// 
//
//Example 1:
//
//Input: num = 3
//Output: "III"
//Explanation: 3 is represented as 3 ones.
//Example 2:
//
//Input: num = 58
//Output: "LVIII"
//Explanation: L = 50, V = 5, III = 3.
//Example 3:
//
//Input: num = 1994
//Output: "MCMXCIV"
//Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.


class Solution {
    func intToRoman(_ num: Int) -> String {
        var numbers: [Int: String] = [
            1: "I", 4: "IV", 5: "V", 9: "IX",
            10: "X", 40: "XL", 50: "L", 90: "XC",
            100: "C", 400: "CD", 500: "D", 900: "CM",
            1000: "M"
        ]
        guard numbers[num] == nil else { return numbers[num]! }
        var n = String(num).count
        var res = ""
        
        for i in String(num) {
            var num = Int(String(i))!
            
            guard num > 0 else { n -= 1; continue }
            
            switch n {
            case 4:
                for i in 1...num { res.append(numbers[1000]!) }
            case 3:
                if num <= 3 {
                    for i in 1...num { res.append(numbers[100]!) }
                } else if 6...8 ~= num {
                    res.append("D")
                    num -= 5
                    for i in 1...num { res.append(numbers[100]!) }
                } else {
                    res.append(numbers[Int(String(i) + "00")!]!)
                }
            case 2:
                if num <= 3 {
                    for i in 1...num { res.append(numbers[10]!) }
                } else if 6...8 ~= num {
                    res.append("L")
                    num -= 5
                    for i in 1...num { res.append(numbers[10]!) }
                } else {
                    res.append(numbers[Int(String(i) + "0")!]!)
                }
            case 1:
                if num <= 3 {
                    for i in 1...num { res.append(numbers[1]!) }
                } else if 6...8 ~= num {
                    res.append("V")
                    num -= 5
                    for i in 1...num { res.append(numbers[1]!) }
                } else {
                    res.append(numbers[num]!)
                }
            default: break
            }
            
            n -= 1
        }
        
        return res
    }
}
