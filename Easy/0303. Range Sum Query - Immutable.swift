// Solution by Vladislav Pavlov
// Difficulty: Easy
// Topics: Array, Design, Prefix Sum
//
//Given an integer array nums, handle multiple queries of the following type:
//
//Calculate the sum of the elements of nums between indices left and right inclusive where left <= right.
//Implement the NumArray class:
//
//NumArray(int[] nums) Initializes the object with the integer array nums.
//int sumRange(int left, int right) Returns the sum of the elements of nums between indices left and right inclusive (i.e. nums[left] + nums[left + 1] + ... + nums[right]).
// 
//
//Example 1:
//
//Input
//["NumArray", "sumRange", "sumRange", "sumRange"]
//[[[-2, 0, 3, -5, 2, -1]], [0, 2], [2, 5], [0, 5]]
//Output
//[null, 1, -1, -3]
//
//Explanation
//NumArray numArray = new NumArray([-2, 0, 3, -5, 2, -1]);
//numArray.sumRange(0, 2); // return (-2) + 0 + 3 = 1
//numArray.sumRange(2, 5); // return 3 + (-5) + 2 + (-1) = -1
//numArray.sumRange(0, 5); // return (-2) + 0 + 3 + (-5) + 2 + (-1) = -3


class NumArray {
    let nums: [Int]
    let prefix: [Int]
    
    init(_ nums: [Int]) {
        self.nums = nums
        
        var prefix: [Int] = [nums[0]]
        
        for i in 1..<nums.count {
            prefix.append(prefix[i-1] + nums[i])
        }
        
        self.prefix = prefix
    }
    
    func sumRange(_ left: Int, _ right: Int) -> Int {
        guard left > 0 || right < nums.count else {
            return 0
        }
        return prefix[right] - prefix[left] + nums[left]
    }
}

/**
 * Your NumArray object will be instantiated and called as such:
 * let obj = NumArray(nums)
 * let ret_1: Int = obj.sumRange(left, right)
 */
