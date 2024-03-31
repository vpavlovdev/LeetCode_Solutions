// Solution by Vladislav Pavlov
// Difficulty: Easy
// Topics: Two Pointers, String, Greedy
//
//Given a string s, return true if the s can be palindrome after deleting at most one character from it.
//
//Example 1:
//Input: s = "aba"
//Output: true
//                                    
//Example 2:
//Input: s = "abca"
//Output: true
//Explanation: You could delete the character 'c'.
//                                    
//Example 3:
//Input: s = "abc"
//Output: false

extension String {
    
   var isPalindrome: Bool {
    var start = self.startIndex
    var end = self.index(before: self.endIndex)
    
    while start < end {
      if self[start] == self[end] {
        start = self.index(after: start)
        end = self.index(before: end)
      } else {
        return false
      }
    }

    return true
  }
}

class Solution {
    func validPalindrome(_ s: String) -> Bool {
        guard s.count > 1 else { return false }

        var left = s.startIndex, right = s.index(before: s.endIndex)
        
        while left < right {
            if s[left] == s[right] {
                left = s.index(after: left)
                right = s.index(before: right)
            } else {
                let leftS = s.index(after: left)
                let rightS = s.index(before: right)
                
                if String(s[leftS...right]).isPalindrome || String(s[left...rightS]).isPalindrome {
                    return true
                } else {
                    return false
                }
                
            }
            
           
        }
        
        return true
    }
}
