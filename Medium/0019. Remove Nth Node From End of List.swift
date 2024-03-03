// Solution by Vladislav Pavlov
// Difficulty: Medium
// Topics: Linked List, Two Pointers
//
//Given the head of a linked list, remove the nth node from the end of the list and return its head.
//
//Example 1:
//Input: head = [1,2,3,4,5], n = 2
//Output: [1,2,3,5]
//
//Example 2:
//Input: head = [1], n = 1
//Output: []
//
//Example 3:
//Input: head = [1,2], n = 1
//Output: [1]


/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
 extension ArraySlice {
    var array: Array<Element> {
        Array(self)
    }
}

class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        guard let head else { return nil }
        
        func getValues(from node: ListNode) -> [Int] {
            guard node.next != nil else { return [node.val]}
            
            return [node.val] + getValues(from: node.next!)
        }
        
        func createList(from nums: [Int]) -> ListNode {
            guard nums.count > 1 else {return ListNode(nums[0])}
            return ListNode(nums[0], createList(from: nums[1..<nums.count].array))
        }
        
        var values = getValues(from: head)
        values.remove(at: values.count - n)
        
        if values.isEmpty {
            return nil
        } else {
            return createList(from: values)
        }
    }
}
