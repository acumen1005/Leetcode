//
//872. Leaf-Similar Trees
//
//Consider all the leaves of a binary tree.  From left to right order, the values of those leaves form a leaf value sequence.
//
//
//
//For example, in the given tree above, the leaf value sequence is (6, 7, 4, 9, 8).
//
//Two binary trees are considered leaf-similar if their leaf value sequence is the same.
//
//Return true if and only if the two given trees with head nodes root1 and root2 are leaf-similar.
//
//
//
//Note:
//
//Both of the given trees will have between 1 and 100 nodes.
//
//https://leetcode.com/problems/leaf-similar-trees/
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
    
    func getLeaf(_ root: TreeNode?) -> String {
        if root == nil {
            return ""
        }
        if root!.left == nil && root!.right == nil {
            return "\(root!.val)"
        }
        let lleaf = getLeaf(root?.left)
        let rleaf = getLeaf(root?.right)
        return "\(lleaf)\(rleaf)"
    }
    
    func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        
        let leaf1 = getLeaf(root1)
        let leaf2 = getLeaf(root2)
        
        return leaf1 == leaf2
    }
}

extension Solution {
    
    func test1() -> (TreeNode?, TreeNode?) {
        let t1 = TreeNode(1, 1)
        let t2 = TreeNode(2, 2)
        let t3 = TreeNode(3, 3)
        
        let t4 = TreeNode(1, 1)
        let t5 = TreeNode(2, 2)
        let t6 = TreeNode(3, 3)
        let t7 = TreeNode(4, 4)
        
        t1.left = t2
        t1.right = t3
        
        t4.left = t7
        t7.left = t5
        t7.right = t6
        
        return (t1, t4)
    }
    
    func test2() -> (TreeNode?, TreeNode?) {
        let t1 = TreeNode(1, 1)
        let t2 = TreeNode(2, 2)
        let t3 = TreeNode(3, 3)
        
        let t4 = TreeNode(1, 1)
        let t5 = TreeNode(2, 2)
        let t6 = TreeNode(3, 3)
        let t7 = TreeNode(4, 4)
        
        t1.left = t2
        t2.right = t3
        
        t4.left = t7
        t7.left = t5
        t5.right = t6
        
        return (t1, t4)
    }
    
}

let s = Solution()
print(s.getLeaf(s.test2().0))
print(s.getLeaf(s.test2().1))
