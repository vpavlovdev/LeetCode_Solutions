// Solution by Vladislav Pavlov
// Difficulty: Easy
// Topics: Linked List, Two Pointers, Stack, Recursion
//
//Given the head of a singly linked list, return true if it is a
//palindrome
// or false otherwise.
//                                                        
//Example 1:
//Input: head = [1,2,2,1]
//Output: true
//                                                        
//Example 2:
//Input: head = [1,2]
//Output: false

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
 extension Array where Element == Int {
    
    var isPalindrom: Bool {
        let ar = Array(self)
        
        for i in 0..<self.count / 2 {
            if ar[i] != ar[self.count - 1 - i] { return false }
        }
        
        return true
    }
}

class Solution {
    @_optimize(speed)
    func isPalindrome(_ head: ListNode?) -> Bool {
        guard head != nil else { return false }
        
        if head?.next == nil { return true }
        
        var head: ListNode? = head
        
        var stack: [Int] = []
        
        while head != nil {
            let value = head!.val
            stack.append(value)
            
            head = head?.next
        }
        
        return stack.isPalindrom
    }
}
