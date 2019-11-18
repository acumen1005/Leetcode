//
//
// 617. Merge Two Binary Trees
//
//Given two binary trees and imagine that when you put one of them to cover the other, some nodes of the two trees are overlapped while the others are not.
//
//You need to merge them into a new binary tree. The merge rule is that if two nodes overlap, then sum node values up as the new value of the merged node. Otherwise, the NOT null node will be used as the node of new tree.
//
//Example 1:
//
//Input:
//    Tree 1                     Tree 2
//          1                         2
//         / \                       / \
//        3   2                     1   3
//       /                           \   \
//      5                             4   7
//Output:
//Merged tree:
//         3
//        / \
//       4   5
//      / \   \
//     5   4   7
//
//
//Note: The merging process must start from the root nodes of both trees.
//
//
// https://leetcode.com/problems/merge-two-binary-trees/
//


/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

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
    func myMergeTrees(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
        
        if t1 == nil && t2 == nil {
            return nil
        }
        
        let treeLeft = myMergeTrees(t1?.left, t2?.left)
        let treeRight = myMergeTrees(t1?.right, t2?.right)
        let mergeValue = (t1?.val ?? 0) + (t2?.val ?? 0)
        
        t1?.val = mergeValue
        t1?.left = treeLeft
        t1?.right = treeRight
        
        if t1 != nil {
            return t1
        }
        if t2 != nil {
            return t2
        }
        return nil
    }
    
    func mergeTrees(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
        if t1 == nil {
            return t2
        }
        if t2 == nil {
            return t1
        }
        let lt = mergeTrees(t1?.left, t2?.left)
        let rt = mergeTrees(t1?.right, t2?.right)
        
        t1!.val += t2!.val
        t1!.left = lt
        t1!.right = rt
        return t1
    }
}

extension Solution {
    
    static func debug(_ t: TreeNode?) {
        if t == nil {
            return
        }
        debug(t?.left)
        debug(t?.right)
        print("debug = \(t?.val)")
    }
    
    func test1() -> (TreeNode?, TreeNode?) {
        print("case1:")
        let t1 = TreeNode(1, 1)
        let t2 = TreeNode(2, 2)
        let t3 = TreeNode(3, 3)
        
        t1.left = t2
        t1.right = t3
        
        let t4 = TreeNode(4, 1)
        let t5 = TreeNode(5, 2)
        let t6 = TreeNode(6, 3)
        
        t4.left = t5
        t5.left = t6
        
        return (t1, t4)
    }
    
    func test2() -> (TreeNode?, TreeNode?) {
        print("case2:")
        let t1 = TreeNode(1, 1)
        let t2 = TreeNode(2, 2)
        let t3 = TreeNode(3, 3)
        let t4 = TreeNode(5, 4)
        
        t1.left = t3
        t1.right = t2
        t3.left = t4
        
        let t5 = TreeNode(2, 1)
        let t6 = TreeNode(1, 2)
        let t7 = TreeNode(3, 3)
        let t8 = TreeNode(4, 4)
        let t9 = TreeNode(7, 5)
        
        t5.left = t6
        t5.right = t7
        t6.right = t8
        t7.right = t9
        
        return (t1, t5)
    }
}

let s = Solution()
let t1 = s.mergeTrees(s.test1().0, nil)
//let t1 = s.test2().0
//let t2 = s.test2().1
//let r2 = s.mergeTrees(t1, t2)
Solution.debug(t1)
//Solution.debug(r2)
