//
//
// 22. Generate Parentheses
//
// https://leetcode.com/problems/generate-parentheses/description/
//
//
//Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.
//
//For example, given n = 3, a solution set is:
//
//[
//"((()))",
//"(()())",
//"(())()",
//"()(())",
//"()()()"
//]

class Solution {
  var result = [String]()
  
  func dfs(_ str: String, left: Int, right: Int) {
    if left == 0 && right == 0 {
      result.append(str)
      return
    }
    if left < 0 || right < 0 {
      return
    }
    if left > right {
      return
    } else {
      dfs(str + "(", left: left - 1, right: right)
      dfs(str + ")", left: left, right: right - 1)
    }
  }
  
  
  func generateParenthesis(_ n: Int) -> [String] {
    result.removeAll()
    dfs("", left: n, right: n)
    return result
  }
}

let s = Solution()
s.generateParenthesis(2)
s.generateParenthesis(3)
s.generateParenthesis(4)
