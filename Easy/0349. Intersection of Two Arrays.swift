// Solution by Vladislav Pavlov
// Difficulty: Easy
// Topics: Array, Hash Table, Two Pointers, Binary Search, Sorting
//
//Given two integer arrays nums1 and nums2, return an array of their intersection. Each element in the result must be unique and you may return the result in any order.
//
// 
//
//Example 1:
//
//Input: nums1 = [1,2,2,1], nums2 = [2,2]
//Output: [2]
//Example 2:
//
//Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
//Output: [9,4]
//Explanation: [4,9] is also accepted.


extension ArraySlice {
    
    var convertToArray: Array<Element> {
        Array(self)
    }
}

class Solution {
    @_optimize(speed)
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var result: [Int] = []
        
        func binarySearch(_ num: Int, array: [Int]) -> Bool {
            guard array.count > 1 else { return array[0] == num }
            
            if array.last! < num { return false }
            
            let mid = array.count / 2
            
            if array[mid] == num {
                return true
            } else if array[mid] < num {
                return binarySearch(num, array: array[mid + 1..<array.count].convertToArray)
            } else {
                return binarySearch(num, array: array[0..<mid].convertToArray)
            }
        }
        
        if nums1.count < nums2.count {
            let array = nums2.sorted()
            for i in nums1 {
                if binarySearch(i, array: array) && !result.contains(i) { result.append(i) }
            }
        } else {
            let array = nums1.sorted()
            for i in nums2 {
                if binarySearch(i, array: array) && !result.contains(i)  { result.append(i) }
            }
        }
        
        return result
    }
}
