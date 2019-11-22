//
//1022. Sum of Root To Leaf Binary Numbers
//
//Given a binary tree, each node has value 0 or 1.  Each root-to-leaf path represents a binary number starting with the most significant bit.  For example, if the path is 0 -> 1 -> 1 -> 0 -> 1, then this could represent 01101 in binary, which is 13.
//
//For all leaves in the tree, consider the numbers represented by the path from the root to that leaf.
//
//Return the sum of these numbers.
//
//
//
//Example 1:
//
//
//
//Input: [1,0,1,0,1,0,1]
//Output: 22
//Explanation: (100) + (101) + (110) + (111) = 4 + 5 + 6 + 7 = 22
//
//
//Note:
//
//The number of nodes in the tree is between 1 and 1000.
//node.val is 0 or 1.
//The answer will not exceed 2^31 - 1.
//
//
//https://leetcode.com/problems/sum-of-root-to-leaf-binary-numbers/
//
//

import Foundation

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
    
    func cal(_ bytes: String) -> Int {
        var rs = 0
        var unit = 1
        for b in bytes.reversed() {
            let t = Int(b.asciiValue! - 48)
            rs += t * unit
            unit *= 2
        }
        return rs
    }
    
    func dfs(_ root: TreeNode?, _ seq: String) -> Int {
        if root == nil {
            return 0
        }
        if root!.left == nil && root!.right == nil {
            let s = "\(seq)\(root!.val)"
            return cal(s)
        }
        let lsum = dfs(root?.left, "\(seq)\(root!.val)")
        let rsum = dfs(root?.right, "\(seq)\(root!.val)")
        
        return lsum + rsum
    }
    
    func sumRootToLeaf(_ root: TreeNode?) -> Int {
        return dfs(root, "")
    }
}

extension Solution {
    
    func test1() -> TreeNode? {
        let t1 = TreeNode(1, 1)
        let t2 = TreeNode(0, 2)
        let t3 = TreeNode(0, 3)
    
        t1.left = t2
        t2.left = t3
        
        return t1
    }
    
    func test2() -> TreeNode? {
        let t1 = TreeNode(1, 1)
        let t2 = TreeNode(0, 2)
        let t3 = TreeNode(1, 3)
        let t4 = TreeNode(0, 4)
        let t5 = TreeNode(1, 5)
        let t6 = TreeNode(0, 6)
        let t7 = TreeNode(1, 7)
        
        t1.left = t2
        t1.right = t3
        t2.left = t4
        t2.right = t5
        t3.left = t6
        t3.right = t7
        
        return t1
    }
    
}

let s = Solution()
s.sumRootToLeaf(s.test1())
s.sumRootToLeaf(s.test2())
s.sumRootToLeaf(nil)
