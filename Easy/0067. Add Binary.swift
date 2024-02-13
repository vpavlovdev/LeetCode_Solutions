// Solution by Vladislav Pavlov
// Difficulty: Easy
// Topics: Math, String, Bit Manipulation, Simulation
//
//Given two binary strings a and b, return their sum as a binary string.
//
//Example 1:
//
//Input: a = "11", b = "1"
//Output: "100"
//Example 2:
//
//Input: a = "1010", b = "1011"
//Output: "10101"

class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
            let a = Array(a); let aLenght = a.count - 1
            let b = Array(b); let bLenght = b.count - 1
            let count = max(a.count, b.count)
            var carry = 0
        
            var result: [Character] = []
            var i = 0
            
            while i < count || carry > 0 {
                let aBit = (i < a.count && a[aLenght - i] == "1") ? 1 : 0
                let bBit = (i < b.count && b[bLenght - i] == "1") ? 1 : 0

                let sum = aBit + bBit + carry
                result.append(sum % 2 > 0 ? "1" : "0")
                carry = sum / 2
                i += 1
            }

            return String(result.reversed())
        }
}
