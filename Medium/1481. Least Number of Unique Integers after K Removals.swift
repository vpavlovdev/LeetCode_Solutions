// Solution by Vladislav Pavlov
// Difficulty: Medium
// Topics: Array, Hash Table, Greedy, Sorting, Counting
//
//Given an array of integers arr and an integer k. Find the least number of unique integers after removing exactly k elements.
//
// 
//
//Example 1:
//
//Input: arr = [5,5,4], k = 1
//Output: 1
//Explanation: Remove the single 4, only 5 is left.
//Example 2:
//Input: arr = [4,3,1,1,3,3,2], k = 3
//Output: 2
//Explanation: Remove 4, 2 and either one of the two 1s or three 3s. 1 and 3 will be left.


class Solution {
    func findLeastNumOfUniqueInts(_ arr: [Int], _ k: Int) -> Int {
        let map: [Int: Int] = arr.reduce(into: [:]) { partialResult, num in
            partialResult[num, default: 0] += 1
        }
        var res = map.count
        var i = k
        
        for count in map.values.sorted() where i > 0 && count <= i {
            res -= 1
            i -= count
        }
        
        return res
    }
}
