//
//700. Search in a Binary Search Tree
//
//
//Given the root node of a binary search tree (BST) and a value. You need to find the node in the BST that the node's value equals the given value. Return the subtree rooted with that node. If such node doesn't exist, you should return NULL.
//
//For example,
//
//Given the tree:
//        4
//       / \
//      2   7
//     / \
//    1   3
//
//And the value to search: 2
//You should return this subtree:
//
//      2
//     / \
//    1   3
//In the example above, if we want to search the value 5, since there is no node with value 5, we should return NULL.
//
//Note that an empty tree is represented by NULL, therefore you would see the expected output (serialized tree format) as [], not null.
//
//https://leetcode.com/problems/search-in-a-binary-search-tree/
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
    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        if root == nil {
            return nil
        }
        if root!.val > val {
            let result = searchBST(root?.left, val)
            return result
        } else if root!.val < val {
            let result = searchBST(root?.right, val)
            return result
        } else {
            return root
        }
    }
}

extension Solution {
    func test1() -> TreeNode? {
        let t1 = TreeNode(4, 1)
        let t2 = TreeNode(2, 2)
        let t3 = TreeNode(7, 3)
        let t4 = TreeNode(1, 4)
        let t5 = TreeNode(3, 5)
    
        t1.left = t2
        t1.right = t3
        t2.left = t4
        t2.right = t5
        
        return t1
    }
    
    func debug(_ root: TreeNode?) {
        if root == nil {
            return
        }
        debug(root?.left)
        debug(root?.right)
        print("\(root!.val)")
    }
}

let s = Solution()
let r1 = s.searchBST(s.test1(), 2)
s.debug(r1)
