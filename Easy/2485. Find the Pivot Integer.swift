// Solution by Vladislav Pavlov
// Difficulty: Easy
// Topics: Math, Prefix Sum
//
//Given a positive integer n, find the pivot integer x such that:
//
//The sum of all elements between 1 and x inclusively equals the sum of all elements between x and n inclusively.
//Return the pivot integer x. If no such integer exists, return -1. It is guaranteed that there will be at most one pivot index for the given input.
//
// 
//
//Example 1:
//
//Input: n = 8
//Output: 6
//Explanation: 6 is the pivot integer since: 1 + 2 + 3 + 4 + 5 + 6 = 6 + 7 + 8 = 21.
//Example 2:
//
//Input: n = 1
//Output: 1
//Explanation: 1 is the pivot integer since: 1 = 1.
//Example 3:
//
//Input: n = 4
//Output: -1
//Explanation: It can be proved that no such integer exist.

class Solution {
    
    // MARK: - 1st solution
    
    func pivotInteger(_ n: Int) -> Int {
        guard n > 1 else { return 1 }
        
        var count = ContiguousArray(repeating: 1, count: n)

        for i in 1..<n {
            count[i] = count[i - 1] + (i + 1)
        }
        
        let sum = count[n - 1]
        
        for j in 1..<n {
            if count[j] == sum - count[j - 1] {
                return j + 1
            }
        }

        return -1
    }
    
    // MARK: - 2nd solution
    
    func pivotInteger(_ n: Int) -> Int {
            guard n > 1 else { return 1 }
            let pivot = (n * n + n) / 2
            let square = Int(Double(pivot).squareRoot())
            
            return square * square == pivot ? square : -1
        }
}
