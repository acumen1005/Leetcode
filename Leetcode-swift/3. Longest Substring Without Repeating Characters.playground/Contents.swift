//: Playground - noun: a place where people can play


//Given a string, find the length of the longest substring without repeating characters.
//
//Examples:
//
//Given "abcabcbb", the answer is "abc", which the length is 3.
//
//Given "bbbbb", the answer is "b", with the length of 1.
//
//Given "pwwkew", the answer is "wke", with the length of 3. Note that the answer must be a substring, "pwke" is a subsequence and not a substring.



// dp[i][j] 前 i 字串中最长不重复子串的长度

class Solution {
  
  func lengthOfLongestSubstring(_ s: String) -> Int {
    
    var dict = [Character: Int]()
    var start = 0
    var lastIndex = 0
    var answer = 0
    var current = 0
    
    while start < s.count {
      let index = s.index(s.startIndex, offsetBy: start)
      let character = s[index]
      if let d = dict[character] {
        lastIndex = max(lastIndex, d + 1)
        current = start - lastIndex + 1
      } else {
        current += 1
      }
      dict[character] = start
      answer = max(answer, current)
      
      start = start + 1
    }
    
    return answer
  }
}

let s = Solution()
s.lengthOfLongestSubstring("c")
s.lengthOfLongestSubstring("abcabcbb")
s.lengthOfLongestSubstring("bbbbb")
s.lengthOfLongestSubstring("pwwkew")
