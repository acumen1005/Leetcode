//: Playground - noun: a place where people can play


//Given a non-empty string s and a dictionary wordDict containing a list of non-empty words, determine if s can be segmented into a space-separated sequence of one or more dictionary words. You may assume the dictionary does not contain duplicate words.
//
//For example, given
//s = "leetcode",
//dict = ["leet", "code"].
//
//Return true because "leetcode" can be segmented as "leet code".
//
//UPDATE (2017/1/4):
//The wordDict parameter had been changed to a list of strings (instead of a set of strings). Please reload the code definition to get the latest changes.


class Solution {
  
  func subStr(_ total: String, _ start: Int, _ length: Int) -> String {
    if start + length > total.count {
      return ""
    }
    let startIndex = total.startIndex
    let begin = total.index(startIndex, offsetBy: start)
    let end = total.index(begin, offsetBy: length)
    return String(total[begin ..< end])
  }
  
  func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
    var dp = Array(repeating: false, count: s.count + 1)
    dp[0] = true
    
    var i = 0
    while i < s.count {
      for word in wordDict {
        let end = i + word.count
        if (end > s.count) {
          continue
        }
        if dp[i] && (subStr(s, i, word.count) == word) {
          dp[end] = true
        }
      }
      i = i + 1
    }
    
    return dp[s.count]
  }
}

//"bb"
//["a","b","bbb","bbbb"]

//leetcode
//["leet","code"]

//"cars"
//["car","ca","rs"]

//"ccbb"
//["bc","cb"]

// true

let s = Solution()
s.wordBreak("cars", ["car","ca","rs"])
s.wordBreak("leetcode", ["leet","code"])
s.wordBreak("leetcoe", ["leet","code"])
s.wordBreak("bb", ["a","b","bbb","bbbb"])
s.wordBreak("ccbb", ["bc","cb"])
s.wordBreak("ccbb", ["bc","cb", "b", "c"])

