// Solution by Vladislav Pavlov
// Difficulty: Easy
// Topics: Array, Hash Table, Two Pointers, Binary Search, Sorting
//
//Given two integer arrays nums1 and nums2, return an array of their intersection. Each element in the result must appear as many times as it shows in both arrays and you may return the result in any order.
//
//Example 1:
//Input: nums1 = [1,2,2,1], nums2 = [2,2]
//Output: [2,2]
//
//Example 2:
//Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
//Output: [4,9]
//Explanation: [9,4] is also accepted.


class Solution {
    @_optimize(speed)
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        if nums1.isEmpty || nums2.isEmpty { return [] }
        
        var result: [Int] = []
        var map: [Int : Int] = [:]
        
        if nums1.count > nums2.count {
            map = nums2.reduce(into: [:]) { partialResult, num in
                partialResult[num, default: 0] += 1
            }
            
            for i in nums1 where map.keys.contains(i) {
                result.append(i)
                map[i]! -= 1
                if map[i]! == 0 { map[i] = nil }
            }
        } else {
            map = nums1.reduce(into: [:]) { partialResult, num in
                partialResult[num, default: 0] += 1
            }
            
            for i in nums2 where map.keys.contains(i) {
                result.append(i)
                map[i]! -= 1
                if map[i]! == 0 { map[i] = nil }
            }
        }
        
        return result
    }
}
