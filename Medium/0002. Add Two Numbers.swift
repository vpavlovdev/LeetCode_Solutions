// Solution by Vladislav Pavlov
// Difficulty: Medium
// Topics: Linked List, Math, Recursion
//
//You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.
//
//You may assume the two numbers do not contain any leading zero, except the number 0 itself.
//
// 
//
//Example 1:
//Input: l1 = [2,4,3], l2 = [5,6,4]
//Output: [7,0,8]
//Explanation: 342 + 465 = 807.
//
//Example 2:
//Input: l1 = [0], l2 = [0]
//Output: [0]
//
//Example 3:
//Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
//Output: [8,9,9,9,0,0,0,1]


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
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil, l2 == nil {
            return nil
        } else if l1 == nil, l2 != nil {
            return l2
        } else if l1 != nil, l2 == nil {
            return l1
        } else {
            func getValues(_ node: ListNode) -> [String] {
                guard let next = node.next else { return [String(node.val)] }
                return [String(node.val)] + getValues(next)
            }
            
            func createList(_ n: [String]) ->  ListNode {
                guard n.count > 1 else { return ListNode(Int(n[0]) ?? 0) }
                return ListNode(Int(n[0]) ?? 0, createList(Array(n[1..<n.count])))
            }
            
            func sum() -> [String] {
                var res: [String] = []
                var val1 = getValues(l1!)
                var val2 = getValues(l2!)
                
                var mind = 0
                
                while !(val1.isEmpty && val2.isEmpty) {
                    var a = val1.isEmpty ? "0" : val1.removeFirst()
                    var b = val2.isEmpty ? "0" : val2.removeFirst()
                    
                    var sum = String((Int(a) ?? 0) + (Int(b) ?? 0) + mind)
                    
                    if val1.isEmpty, val2.isEmpty, sum.count > 1 {
                        res.append(String(sum.removeLast()))
                    } else {
                        if sum.count > 1 {
                            mind = Int(String(sum.removeFirst()))!
                        } else {
                            mind = 0
                        }
                    }
                    
                    res.append(sum)
                }
                
                return res
            }
           
            var returnedlist = createList(sum())
            return returnedlist
        }
    }
}
