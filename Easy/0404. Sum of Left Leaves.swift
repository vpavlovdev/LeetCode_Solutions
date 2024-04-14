// Solution by Vladislav Pavlov
// Difficulty: Easy
// Topics: Tree, Depth-First Search, Breadth-First Search, Binary Tree
//
//Given the root of a binary tree, return the sum of all left leaves.
//
//A leaf is a node with no children. A left leaf is a leaf that is the left child of another node.
//
//Example 1:
//Input: root = [3,9,20,null,null,15,7]
//Output: 24
//Explanation: There are two left leaves in the binary tree, with values 9 and 15 respectively.
//
//Example 2:
//Input: root = [1]
//Output: 0


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
    func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        
        func dfs(_ root: TreeNode?, _ isLeft: Bool) -> Int {
            guard let root else { return 0 }
            guard root.left != nil || root.right != nil || !isLeft else { return root.val }
            
            return dfs(root.left, true) + dfs(root.right, false)
        }
        
        return dfs(root, false)
    }
}
