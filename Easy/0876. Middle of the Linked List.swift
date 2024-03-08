// Solution by Vladislav Pavlov
// Difficulty: Easy
// Topics: Linked List, Two Pointers
//
//Given the head of a singly linked list, return the middle node of the linked list.
//
//If there are two middle nodes, return the second middle node.
//
//Example 1:
//Input: head = [1,2,3,4,5]
//Output: [3,4,5]
//Explanation: The middle node of the list is node 3.
//
//Example 2:
//Input: head = [1,2,3,4,5,6]
//Output: [4,5,6]
//Explanation: Since the list has two middle nodes with values 3 and 4, we return the second one.

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
class Solution {
    func middleNode(_ head: ListNode?) -> ListNode? {
         var left = head
         var right = head?.next

         while right != nil {
             left = left?.next
             right = right?.next?.next
         }

         return left
    }
}
