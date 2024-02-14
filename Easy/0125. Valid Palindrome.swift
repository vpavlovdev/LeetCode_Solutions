// Solution by Vladislav Pavlov
// Difficulty: Easy
// Topics: Two Pointers, String
//
//A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers.
//
//Given a string s, return true if it is a palindrome, or false otherwise.
//
// 
//
//Example 1:
//
//Input: s = "A man, a plan, a canal: Panama"
//Output: true
//Explanation: "amanaplanacanalpanama" is a palindrome.
//Example 2:
//
//Input: s = "race a car"
//Output: false
//Explanation: "raceacar" is not a palindrome.
//Example 3:
//
//Input: s = " "
//Output: true
//Explanation: s is an empty string "" after removing non-alphanumeric characters.
//Since an empty string reads the same forward and backward, it is a palindrome.

class Solution {
    func isPalindrome(_ s: String) -> Bool {
        guard s.count >= 1 else { return false }
        var str = s.filter { $0.isLetter || $0.isNumber }
        
        if str.isEmpty { return true }
        
        return str.lowercased() == String(str.lowercased().reversed())
    }
}
