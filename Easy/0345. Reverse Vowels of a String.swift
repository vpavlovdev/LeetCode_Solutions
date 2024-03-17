// Solution by Vladislav Pavlov
// Difficulty: Easy
// Topics: Two Pointers, String
//
//Given a string s, reverse only all the vowels in the string and return it.
//
//The vowels are 'a', 'e', 'i', 'o', and 'u', and they can appear in both lower and upper cases, more than once.
//
//Example 1:
//Input: s = "hello"
//Output: "holle"
//
//Example 2:
//Input: s = "leetcode"
//Output: "leotcede"

class Solution {
    func reverseVowels(_ s: String) -> String {
        let vowels = Set("aeiouAEIOU")
        var left = 0
        var right = s.count - 1
        var array = Array(s)
        
        while left < right {
            if vowels.contains(array[left]),
               vowels.contains(array[right]) {
                (array[left], array[right]) =  (array[right], array[left])
                left += 1
                right -= 1
            } else if vowels.contains(array[left]) {
                right -= 1
            } else if vowels.contains(array[right]) {
                left += 1
            } else {
                left += 1
                right -= 1
            }
        }
        
        return String(array)
    }
}
