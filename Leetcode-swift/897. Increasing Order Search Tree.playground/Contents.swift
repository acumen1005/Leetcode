//
// 897. Increasing Order Search Tree
//
//Given a binary search tree, rearrange the tree in in-order so that the leftmost node in the tree is now the root of the tree, and every node has no left child and only 1 right child.
//
//Example 1:
//Input: [5,3,6,2,4,null,8,1,null,null,null,7,9]
//
//       5
//      / \
//    3    6
//   / \    \
//  2   4    8
// /        / \
//1        7   9
//
//Output: [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9]
//
// 1
//  \
//   2
//    \
//     3
//      \
//       4
//        \
//         5
//          \
//           6
//            \
//             7
//              \
//               8
//                \
//                 9
//Note:
//
//The number of nodes in the given tree will be between 1 and 100.
//Each node will have a unique integer value from 0 to 1000.
//
//
//
//  https://leetcode.com/problems/increasing-order-search-tree/
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
    var resultRoot: TreeNode?
    var nowRoot: TreeNode?
    
    func inOrders(_ root: TreeNode?) {
        if root == nil {
            return
        }
        inOrders(root?.left)
        
        if resultRoot == nil {
            resultRoot = root
        }
        if nowRoot == nil {
            nowRoot = root
        } else {
            root?.left = nil
            nowRoot?.right = root
            nowRoot = root
        }
        
        inOrders(root?.right)
    }
    
    func increasingBST(_ root: TreeNode?) -> TreeNode? {
        resultRoot = nil
        inOrders(root)
        return resultRoot
    }
}

extension Solution {
    
    func debug(_ root: TreeNode?) {
        if root == nil {
            return
        }
        debug(root?.left)
        
        print("\(root!.val)")
        
        debug(root?.right)
    }
  
    func test1() -> TreeNode? {
        let t1 = TreeNode(5, 1)
        let t2 = TreeNode(3, 2)
        let t3 = TreeNode(6, 3)
        let t4 = TreeNode(2, 4)
        let t5 = TreeNode(4, 5)
        let t6 = TreeNode(8, 6)
        let t7 = TreeNode(1, 7)
        let t8 = TreeNode(7, 8)
        let t9 = TreeNode(9, 9)
        
        t1.left = t2
        t1.right = t3
        t2.left = t4
        t2.right = t5
        t3.right = t6
        t6.right = t7
        t4.left = t7
        t6.left = t8
        t6.right = t9
        
        return t1
    }
}

let s = Solution()
let rs = s.increasingBST(s.test1())
s.debug(rs)
