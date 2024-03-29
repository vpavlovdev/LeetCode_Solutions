// Solution by Vladislav Pavlov
// Difficulty: Easy
// Topics: Divide and Conquer, Bit Manipulation
//
//Write a function that takes the binary representation of a positive integer and returns the number of
//set bits
// it has (also known as the Hamming weight).
//
//Example 1:
//Input: n = 11
//Output: 3
//Explanation:
//The input binary string 1011 has a total of three set bits.
//
//Example 2:
//Input: n = 128
//Output: 1
//Explanation:
//The input binary string 10000000 has a total of one set bit.
//
//Example 3:
//Input: n = 2147483645
//Output: 30
//Explanation:
//The input binary string 1111111111111111111111111111101 has a total of thirty set bits.

extension Int {
    
    var count_1_bits: Int {
        var count = 0
        for i in convert(self) where i == "1" {
            count += 1
        }
        return count
    }
    
    private func convert(_ v: Int) -> String {
        guard v >= 2 else { return "\(v % 2)" }
        return "\(v % 2)\(convert(v / 2))"
    }
}
class Solution {
    func hammingWeight(_ n: Int) -> Int {
    n.count_1_bits
    }
}
