//
//
// 20. Valid Parentheses
//
// https://leetcode.com/problems/valid-parentheses/description/
//
//
//Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
//
//An input string is valid if:
//
//Open brackets must be closed by the same type of brackets.
//Open brackets must be closed in the correct order.
//Note that an empty string is also considered valid.
//
//Example 1:
//
//Input: "()"
//Output: true
//Example 2:
//
//Input: "()[]{}"
//Output: true
//Example 3:
//
//Input: "(]"
//Output: false
//Example 4:
//
//Input: "([)]"
//Output: false
//Example 5:
//
//Input: "{[]}"
//Output: true

class Solution {
  func isValid(_ s: String) -> Bool {
    var stack = [Character]()
    
    for character in s {
      if character == Character(")") {
        if let last = stack.last, last == Character("(") {
          stack.popLast()
        } else { return false }
      } else if character == Character("}") {
        if let last = stack.last, last == Character("{") {
          stack.popLast()
        } else { return false }
      } else if character == Character("]") {
        if let last = stack.last, last == Character("[") {
          stack.popLast()
        } else { return false }
      } else {
        stack.append(character)
      }
    }
    
    return stack.isEmpty
  }
}

let s = Solution()
s.isValid("()")
s.isValid("()[]{}")
s.isValid("(]")
s.isValid("([)]")
s.isValid("{[]}")
s.isValid("")
s.isValid("]")
