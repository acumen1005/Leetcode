//
// https://leetcode.com/problems/merge-two-sorted-lists/description/
//
// 21. Merge Two Sorted Lists
//
//Merge two sorted linked lists and return it as a new list. The new list should be made by splicing together the nodes of the first two lists.
//
//Example:
//
//Input: 1->2->4, 1->3->4
//Output: 1->1->2->3->4->4


/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init(_ val: Int) {
    self.val = val
    self.next = nil
  }
}

class Solution {
  func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var h1 = l1
    var h2 = l2
    let head = ListNode(0)
    var h3: ListNode? = head
    
    while h1 != nil && h2 != nil {
      if h1!.val > h2!.val {
        h3!.next = h2
        h2 = h2?.next
      } else {
        h3!.next = h1
        h1 = h1?.next
      }
      h3 = h3!.next
    }
    while h1 != nil {
      h3!.next = h1
      h1 = h1?.next
      h3 = h3!.next
    }
    while h2 != nil {
      h3!.next = h2
      h2 = h2?.next
      h3 = h3!.next
    }
    return head.next
  }
}
