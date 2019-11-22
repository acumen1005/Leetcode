//
//104. Maximum Depth of Binary Tree
//
//Given a binary tree, find its maximum depth.
//
//The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.
//
//Note: A leaf is a node with no children.
//
//Example:
//
//Given binary tree [3,9,20,null,null,15,7],
//
//    3
//   / \
//  9  20
//    /  \
//   15   7
//return its depth = 3.
//
//https://leetcode.com/problems/maximum-depth-of-binary-tree/
//
//


public class TreeNode {
  public var id: Int
  public var val: Int
  public var left: TreeNode?
  public var right: TreeNode?
  public init(_ val: Int, _ id: Int) {
    self.id = id
    self.val = val
    self.left = nil
    self.right = nil
  }
}

class Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        let lmaxDepth = maxDepth(root?.left)
        let rmaxDepth = maxDepth(root?.right)
        
        return max(lmaxDepth, rmaxDepth) + 1
    }
}

extension Solution {
    
    func test1() -> TreeNode? {
        let t1 = TreeNode(1, 1)
        let t2 = TreeNode(2, 2)
        let t3 = TreeNode(3, 3)
        
        t1.left = t2
        t1.right = t3
        
        return t1
    }
    
    func test2() -> TreeNode? {
        let t4 = TreeNode(1, 1)
        let t5 = TreeNode(2, 2)
        let t6 = TreeNode(3, 3)
        let t7 = TreeNode(4, 4)
        
        t4.left = t7
        t7.left = t5
        t5.right = t6
        
        return t4
    }
    
}

let s = Solution()
print(s.maxDepth(s.test1()))
print(s.maxDepth(s.test2()))
print(s.maxDepth(nil))
print(s.maxDepth(TreeNode(1, 1)))
