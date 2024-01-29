// Solution by Vladislav Pavlov
// Difficulty: Easy
// Topics: Math, Dynamic Programming, Memoization
//
//You are climbing a staircase. It takes n steps to reach the top.
//
//Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
//
// 
//
//Example 1:
//
//Input: n = 2
//Output: 2
//Explanation: There are two ways to climb to the top.
//1. 1 step + 1 step
//2. 2 steps
//Example 2:
//
//Input: n = 3
//Output: 3
//Explanation: There are three ways to climb to the top.
//1. 1 step + 1 step + 1 step
//2. 1 step + 2 steps
//3. 2 steps + 1 step

// With recursion
class Solution {
    var map = [Int: Int]()
    func climbStairs(_ n: Int) -> Int {
        return recursive(n, &map)
    }

    func recursive(_ n: Int,_ map: inout [Int: Int]) -> Int {
        if n < 0 { return 0}
        if n == 0 { return 1}
        if let val = map[n] {
            return val
        }
        var a = recursive(n-1, &map)
        var b = recursive(n-2, &map)
        map[n] = a + b

        return a + b
    }
}

// Without recursion
class Solution {
    func climbStairs(_ n: Int) -> Int {
        guard n >= 3 else { return n }
        var array = [1, 1]
        
        for i in 2..<n {
            array.append(array[i - 1] + array [i - 2])
        }

        return array[n - 1] +  array [n - 2]
    }
}
