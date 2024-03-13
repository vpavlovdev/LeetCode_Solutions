// Solution by Vladislav Pavlov
// Difficulty: Medium
// Topics: Hash Table, Linked List
//
//Given the head of a linked list, we repeatedly delete consecutive sequences of nodes that sum to 0 until there are no such sequences.
//
//After doing so, return the head of the final linked list.  You may return any such answer.
//
// 
//
//(Note that in the examples below, all sequences are serializations of ListNode objects.)
//
//Example 1:
//
//Input: head = [1,2,-3,3,1]
//Output: [3,1]
//Note: The answer [1,2,1] would also be accepted.
//Example 2:
//
//Input: head = [1,2,3,-3,4]
//Output: [1,2,4]
//Example 3:
//
//Input: head = [1,2,3,-3,-2]
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
class Solution {
    func removeZeroSumSublists(_ head: ListNode?) -> ListNode? {
        var prefixSum = 0
        var map = [Int: ListNode]()

        var dummy = ListNode(0)
        dummy.next = head
        map[0] = dummy
        var current = head
        while current != nil {
            prefixSum += current!.val
            map[prefixSum] = current
            current = current!.next
        }

        prefixSum = 0
        current = dummy
        while current != nil {
            prefixSum += current!.val
            current!.next = map[prefixSum]?.next
            current = current?.next
        }
        return dummy.next
    }
}
