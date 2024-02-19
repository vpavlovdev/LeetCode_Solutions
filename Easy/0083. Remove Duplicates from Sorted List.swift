// Solution by Vladislav Pavlov
// Difficulty: Easy
// Topics: Linked List
//
//Given the head of a sorted linked list, delete all duplicates such that each element appears only once. Return the linked list sorted as well.
//
//Example 1:
//Input: head = [1,1,2]
//Output: [1,2]
//
//Example 2:
//Input: head = [1,1,2,3,3]
//Output: [1,2,3]

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
     func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var current = head
        var last: ListNode?
        
        while current != nil {
            if last != nil && current!.val == last!.val {
                last?.next = current?.next
                
            } else {
                last = current
            }
            
            current = current?.next
        }
        
        return head
    }
}
