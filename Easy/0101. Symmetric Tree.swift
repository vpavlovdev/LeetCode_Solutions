// Solution by Vladislav Pavlov
// Difficulty: Easy
// Topics: Tree, Depth-First Search, Breadth-First Search, Binary Tree
//
//Given the root of a binary tree, check whether it is a mirror of itself (i.e., symmetric around its center).
//
//Example 1:
//Input: root = [1,2,2,3,4,4,3]
//Output: true
//
//Example 2:
//Input: root = [1,2,2,null,3,null,3]
//Output: false


/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    
    func isSymmetric(_ root: TreeNode?) -> Bool {
        guard root != nil else { return true }
        return isMirror(root?.left, root?.right)
    }
    
    private func isMirror(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
        switch (left, right) {
        case (nil, nil):
            return true
        case let (left?, right?) where left.val == right.val:
            return isMirror(left.left, right.right) &&
            isMirror(left.right, right.left)
        default:
            return false
        }
    }
}
