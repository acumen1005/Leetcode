//
// https://leetcode.com/problems/remove-nth-node-from-end-of-list/description/
//
// 19. Remove Nth Node From End of List
//
//Given a linked list, remove the n-th node from the end of list and return its head.
//
//Example:
//
//Given linked list: 1->2->3->4->5, and n = 2.
//
//After removing the second node from the end, the linked list becomes 1->2->3->5.
//Note:
//
//Given n will always be valid.
//
//Follow up:
//
//Could you do this in one pass?


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
  
  func create() -> ListNode? {
    let node1 = ListNode(1)
    let node2 = ListNode(2)
    let node3 = ListNode(3)
    let node4 = ListNode(4)
    let node5 = ListNode(5)
    
    node1.next = node2
    node2.next = node3
    node3.next = node4
    node4.next = node5
    node5.next = nil
    return node1
  }
  
  func query(_ head: ListNode?) {
    var ptr = head
    while ptr != nil {
      print(ptr!.val)
      ptr = ptr?.next
    }
  }
  
  func numberOfList(_ head: ListNode?) -> Int {
    var count = 0
    var ptr = head
    while ptr != nil {
      count += 1
      ptr = ptr?.next
    }
    return count
  }
  
  func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    var count = numberOfList(head) - n
    
    if count == 0 {
      return head?.next
    }

    var ptr = head
    while ptr != nil {
      if count == 1 {
        ptr?.next = ptr?.next?.next
        return head
      }
      count -= 1
      ptr = ptr?.next
    }
    
    return head
  }
}

let s = Solution()
let a = s.removeNthFromEnd(s.create(), 2)
s.query(a)
