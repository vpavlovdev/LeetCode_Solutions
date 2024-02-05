// Solution by Vladislav Pavlov
// Difficulty: Easy
// Topics: Array, Hash Table, Bit Manipulation, Sorting
//
//You have a set of integers s, which originally contains all the numbers from 1 to n. Unfortunately, due to some error, one of the numbers in s got duplicated to another number in the set, which results in repetition of one number and loss of another number.
//
//You are given an integer array nums representing the data status of this set after the error.
//
//Find the number that occurs twice and the number that is missing and return them in the form of an array.
//
// 
//
//Example 1:
//
//Input: nums = [1,2,2,4]
//Output: [2,3]
//Example 2:
//
//Input: nums = [1,1]
//Output: [1,2]


class Solution {
    func findErrorNums(_ nums: [Int]) -> [Int] {
      var duplicate = 0
        var missing = 0
        
        var set: Set<Int> = nums.reduce(into: []) { partialResult, number in
            if partialResult.contains(number) {
                duplicate = number
            } else {
                partialResult.insert(number)
            }
        }
        
        for i in 1...nums.count where !set.contains(i) {
            print(i)
            missing = i
            break
        }
        return [duplicate, missing]
    }
}

class Solution {
    func findErrorNums(_ nums: [Int]) -> [Int] {
        guard nums.count > Set(nums).count else { return [] }
        
        var duplicate : [Int: Int] = nums.reduce(into: [:]) { partialResult, number in
            partialResult[number, default: 0] += 1
        }
        var result = duplicate.keys.filter{ duplicate[$0] == 2 }
        
        let sum = (nums.count * (nums.count + 1)) / 2
        let missing = sum - (nums.reduce(0, +) - result.first!)
        
        result.append(missing)
        
        return result
    }
}
