//
//
//965. Univalued Binary Tree
//
//A binary tree is univalued if every node in the tree has the same value.
//
//Return true if and only if the given tree is univalued.
//
//
//
//Example 1:
//
//
//Input: [1,1,1,1,1,null,1]
//Output: true
//Example 2:
//
//
//Input: [2,2,2,5,2]
//Output: false
//
//
//Note:
//
//The number of nodes in the given tree will be in the range [1, 100].
//Each node's value will be an integer in the range [0, 99].
//
//
// https://leetcode.com/problems/univalued-binary-tree/
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


// 剪枝：如果有一个结果是 false 的不在递归了。
class Solution {
    func isUnivalTree(_ root: TreeNode?) -> Bool {
        if root == nil {
            return true
        }
        let left = isUnivalTree(root?.left)
        let right = isUnivalTree(root?.right)
        
        let val = root!.val
        var result = left && right
        if root!.left != nil {
            result = (root!.left!.val == val) && result
        }
        if root!.right != nil {
            result = (root!.right!.val == val) && result
        }
        return result
    }
}

extension Solution {
    
    func test1() -> TreeNode? {
        let t1 = TreeNode(1, 1)
        let t2 = TreeNode(1, 2)
        let t3 = TreeNode(1, 3)
        let t4 = TreeNode(2, 4)
        let t5 = TreeNode(1, 5)
        
        t1.left = t2
        t1.right = t3
        t2.left = t4
        t2.right = t5
        
        return t1
    }
    
}

let s = Solution()
s.isUnivalTree(s.test1())
