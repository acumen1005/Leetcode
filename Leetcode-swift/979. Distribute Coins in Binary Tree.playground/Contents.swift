//979. Distribute Coins in Binary Tree
//
//Given the root of a binary tree with N nodes, each node in the tree has node.val coins, and there are N coins total.
//
//In one move, we may choose two adjacent nodes and move one coin from one node to another.  (The move may be from parent to child, or from child to parent.)
//
//Return the number of moves required to make every node have exactly one coin.
//
//
//1<= N <= 100
//0 <= node.val <= N
//
//
//https://leetcode.com/problems/distribute-coins-in-binary-tree/
//
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
  let avg = 1
  
  func solve(_ root: TreeNode?) -> Int {
    if root == nil {
      return 0
    }
    let lret = solve(root?.left)
    let rret = solve(root?.right)
    // print 后序
    var ret = lret + rret
    
    ret += abs(root!.left?.val ?? 0)
    ret += abs(root!.right?.val ?? 0)
    
    root!.val += (root!.left?.val ?? 0) + (root!.right?.val ?? 0) - avg
    
    return ret
  }
  
  func distributeCoins(_ root: TreeNode?) -> Int {
    let result = solve(root)
    print("result = \(result)")
    return result
  }
}

extension Solution {
  func testTree1() -> TreeNode? {
    print("case1:")
    let t1 = TreeNode(3, 1)
    let t2 = TreeNode(0, 2)
    let t3 = TreeNode(0, 3)
    
    t1.left = t2
    t1.right = t3
    
    return t1
  }
  
  func testTree2() -> TreeNode? {
    print("case2:")
    let t1 = TreeNode(0, 1)
    let t2 = TreeNode(3, 2)
    let t3 = TreeNode(0, 3)
    
    t1.left = t2
    t1.right = t3
    
    return t1
  }
  
  func testTree3() -> TreeNode? {
    print("case3:")
    let t1 = TreeNode(1, 1)
    let t2 = TreeNode(0, 2)
    let t3 = TreeNode(2, 3)
    
    t1.left = t2
    t1.right = t3
    
    return t1
  }
  
  func testTree4() -> TreeNode? {
    print("case4:")
    let t1 = TreeNode(1, 1)
    let t2 = TreeNode(0, 2)
    let t3 = TreeNode(0, 3)
    let t4 = TreeNode(3, 4)
    
    t1.left = t2
    t1.right = t3
    t2.right = t4
    
    return t1
  }
  
  func testTree5() -> TreeNode? {
    print("case5:")
    let t1 = TreeNode(0, 1)
    let t2 = TreeNode(0, 2)
    let t3 = TreeNode(3, 3)
    let t4 = TreeNode(0, 4)
    let t5 = TreeNode(3, 5)
    let t6 = TreeNode(0, 6)
    
    t1.left = t2
    t1.right = t3
    t2.left = t4
    t2.right = t5
    t4.left = t6
    
    return t1
  }
  
  func testTree6() -> TreeNode? {
    print("case6:")
    let t1 = TreeNode(1, 1)
    
    return t1
  }
  
  func testTree7() -> TreeNode? {
    print("case7:")
    let t1 = TreeNode(0, 1)
    let t2 = TreeNode(1, 2)
    let t3 = TreeNode(0, 3)
    let t4 = TreeNode(3, 4)
    
    t1.left = t2
    t2.left = t3
    t3.left = t4
    
    return t1
  }
}


let s = Solution()
s.distributeCoins(s.testTree1())
s.distributeCoins(s.testTree2())
s.distributeCoins(s.testTree3())
s.distributeCoins(s.testTree4())
s.distributeCoins(s.testTree5())
s.distributeCoins(s.testTree6())
s.distributeCoins(s.testTree7())
