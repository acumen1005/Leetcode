//: Playground - noun: a place where people can play

//https://leetcode.com/problems/longest-palindromic-substring/description/
//
//5. Longest Palindromic Substring
//
//Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.
//
//Example 1:
//
//Input: "babad"
//Output: "bab"
//Note: "aba" is also a valid answer.
//Example 2:
//
//Input: "cbbd"
//Output: "bb"

// 枚举长度和回文 中心点

extension String {

  subscript(_ index: Int) -> Character {
    return self[self.index(self.startIndex, offsetBy: index)]
  }

}

class Solution {

  func solve(_ str: String) -> String {
    
    if str.isEmpty { return "" }
    
    var ans = (0, 0)
    for (index, _) in str.enumerated() {
      ans = findMax(a: isPalindrome(str, start: index, end: index + 1), b: ans)
    }
    
    for (index, _) in str.enumerated() {
      ans = findMax(a: isPalindrome(str, start: index - 1, end: index + 1), b: ans)
    }
    
    var result = ""
    
    for index in ans.0 ... ans.1 {
      result.append(str[index])
    }
    
    return result
  }

  func isPalindrome(_ str: String, start: Int, end: Int) -> (left: Int, right: Int) {
    guard start >= 0 && end < str.count else { return (0, 0) }
    var result: (Int, Int) = (0, 0)
    var (index1, index2) = (start, end)
    while index1 >= 0 && index2 < str.count {
      if str[index1] != str[index2] {
        return result
      } else {
        result = (result.1 - result.0 + 1) > (index2 - index1 + 1) ? result : (index1, index2)
      }
      index1 -= 1
      index2 += 1
    }
    return result
  }
  
  func findMax(a: (Int, Int), b: (Int, Int)) -> (Int, Int) {
    let lengthA = (a.1 - a.0)
    let lengthB = (b.1 - b.0)
    return (lengthA > lengthB ? a : b)
  }

  func longestPalindrome(_ s: String) -> String {
    return solve(s)
  }
}


let s = Solution()
s.solve("babad")
s.solve("babd")
s.solve("cbbd")
s.solve("abcd")
s.solve("abcddcba")
s.solve("bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb")
