//
// 538. Convert BST to Greater Tree
//
//Given a Binary Search Tree (BST), convert it to a Greater Tree such that every key of the original BST is changed to the original key plus sum of all keys greater than the original key in BST.
//
//Example:
//
//Input: The root of a Binary Search Tree like this:
//              5
//            /   \
//           2     13
//
//Output: The root of a Greater Tree like this:
//             18
//            /   \
//          20     13
//
//
// https://leetcode.com/problems/convert-bst-to-greater-tree/
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
  
  func inOrder(_ root: TreeNode?) {
    if root == nil {
      return
    }

    inOrder(root?.right)
    root!.val += sum
    sum = root!.val
    inOrder(root?.left)
  }
  
  func convertBST(_ root: TreeNode?) -> TreeNode? {
    
    inOrder(root)
    
//    debugTree(root)
    
    return root
  }
}

extension Solution {
  
  func debugTree(_ root: TreeNode?) {
    if root == nil {
      return
    }
    print("id = \(root!.id) node = \(root!.val)")
    debugTree(root?.left)
    debugTree(root?.right)
  }
  
  
  func testCase1() -> TreeNode? {
    print("case1: ")
    let t1 = TreeNode(2, 1)
    let t2 = TreeNode(0, 2)
    let t3 = TreeNode(3, 3)
    let t4 = TreeNode(-4, 4)
    let t5 = TreeNode(1, 5)
    
    t1.left = t2
    t1.right = t3
    t2.left = t4
    t2.right = t5
    
    return t1
  }
  
  func testCase2() -> TreeNode? {
    print("case2: ")
    let t1 = TreeNode(1, 1)
    let t2 = TreeNode(0, 2)
    let t3 = TreeNode(4, 3)
    let t4 = TreeNode(-2, 4)
    let t5 = TreeNode(3, 5)
    
    t1.left = t2
    t1.right = t3
    t2.left = t4
    t3.left = t5
    
    return t1
  }
  
  func testCase3() -> TreeNode? {
    print("case3: ")
    let t1 = TreeNode(4, 1)
    let t2 = TreeNode(3, 2)
    let t3 = TreeNode(2, 3)
    let t4 = TreeNode(1, 4)
    
    t1.left = t2
    t2.left = t3
    t3.left = t4
    
    return t1
  }
  
  func testCase4() -> TreeNode? {
    print("case4: ")
    let t1 = TreeNode(0, 1)
    let t2 = TreeNode(-1, 2)
    let t3 = TreeNode(2, 3)
    let t4 = TreeNode(-3, 4)
    let t5 = TreeNode(4, 5)
    
    t1.left = t2
    t1.right = t3
    t2.left = t4
    t3.right = t5
    
    return t1
  }
}

let s = Solution()
s.convertBST(s.testCase1())
//s.convertBST(s.testCase2())
//s.convertBST(s.testCase3())
//s.convertBST(s.testCase4())

