//
//
// 938. Range Sum of BST
//
//Given the root node of a binary search tree, return the sum of values of all nodes with value between L and R (inclusive).
//
//The binary search tree is guaranteed to have unique values.
//
//
//
//Example 1:
//
//Input: root = [10,5,15,3,7,null,18], L = 7, R = 15
//Output: 32
//Example 2:
//
//Input: root = [10,5,15,3,7,13,18,1,null,6], L = 6, R = 10
//Output: 23
//
//
//Note:
//
//The number of nodes in the tree is at most 10000.
//The final answer is guaranteed to be less than 2^31.
//
//
// https://leetcode.com/problems/range-sum-of-bst/
//
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
    
    var sum = 0
    
    func rangSum(_ root: TreeNode?, _ L: Int, _ R: Int) {
        if root == nil {
            return
        }
        
        if root!.val >= L && root!.val <= R {
            sum += root!.val
        }
        if L < root!.val {
            rangSum(root?.left, L, R)
        }
        if R > root!.val {
            rangSum(root?.right, L, R)
        }
    }
  
    func rangeSumBST(_ root: TreeNode?, _ L: Int, _ R: Int) -> Int {
        sum = 0
        rangSum(root, L, R)
        return sum
    }
}

extension Solution {
    func testCase1() -> TreeNode? {
        let t1 = TreeNode(10, 1)
        let t2 = TreeNode(5, 2)
        let t3 = TreeNode(15, 3)
        let t4 = TreeNode(3, 4)
        let t5 = TreeNode(7, 5)
        let t6 = TreeNode(18, 6)
        
        t1.left = t2
        t1.right = t3
        t2.left = t4
        t2.right = t5
        t3.right = t6
        
        return t1
    }
}

//[10,5,15,3,7,null,18]
//7
//15

let s = Solution()
s.rangeSumBST(s.testCase1(), 7, 15)
