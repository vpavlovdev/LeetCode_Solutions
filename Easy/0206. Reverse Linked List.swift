// Solution by Vladislav Pavlov
// Difficulty: Easy
// Topics: Linked List, Recursion
//
//Given the head of a singly linked list, reverse the list, and return the reversed list.
//
//Example 1:
//Input: head = [1,2,3,4,5]
//Output: [5,4,3,2,1]
//
//Example 2:
//Input: head = [1,2]
//Output: [2,1]
//
//Example 3:
//Input: head = []
//Output: []


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
    func reverseList(_ head: ListNode?) -> ListNode? {
        var prevNode: ListNode?, nextNode: ListNode?
        var currentNode: ListNode? = head
        
        while currentNode != nil {
            nextNode = currentNode?.next
            currentNode?.next = prevNode
            prevNode = currentNode
            
            if nextNode == nil { break }
            currentNode = nextNode
        }
        
        return currentNode
    }
}
