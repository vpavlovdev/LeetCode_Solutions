// Solution by Vladislav Pavlov
// Difficulty: Easy
// Topics: Linked List, Recursion
//
//You are given the heads of two sorted linked lists list1 and list2.
//
//Merge the two lists into one sorted list. The list should be made by splicing together the nodes of the first two lists.
//
//Return the head of the merged linked list.
//
//Example 1:
//Input: list1 = [1,2,4], list2 = [1,3,4]
//Output: [1,1,2,3,4,4]
//
//Example 2:
//Input: list1 = [], list2 = []
//Output: []
//
//Example 3:
//Input: list1 = [], list2 = [0]
//Output: [0]

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
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        if list1 == nil, list2 == nil {
            return nil
        } else if list1 == nil, list2 != nil {
            return list2
        } else if list1 != nil, list2 == nil {
            return list1
        } else {
            func getValues(_ node: ListNode) -> [Int] {
                guard let next = node.next else { return [node.val] }
                return [node.val] + getValues(next)
            }
            
            func createList(_ n: [Int]) ->  ListNode {
                guard n.count > 1 else { return ListNode(n[0]) }
                return ListNode(n[0], createList(Array(n[1..<n.count])))
            }
            
            var array: [Int] = (getValues(list1!) + getValues(list2!)).sorted()
            var returnedlist = createList(array)
            
            return returnedlist
        }
    }
}
