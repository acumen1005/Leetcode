//
// https://leetcode.com/problems/longest-common-prefix/description/
//
//
// 14. Longest Common Prefix
//
//Write a function to find the longest common prefix string amongst an array of strings.
//
//If there is no common prefix, return an empty string "".
//
//Example 1:
//
//Input: ["flower","flow","flight"]
//Output: "fl"
//Example 2:
//
//Input: ["dog","racecar","car"]
//Output: ""
//Explanation: There is no common prefix among the input strings.
//Note:
//
//All given inputs are in lowercase letters a-z.

extension String {
  subscript(_ index: Int) -> Character {
    return self[self.index(self.startIndex, offsetBy: index)]
  }
}

class Solution {
  
  func output(_ str: String?, to: Int) -> String {
    guard let str = str else { return "" }
    
    let characters = [Character](str)
    return String(characters[0 ..< to])
  }
  
  func longestCommonPrefix(_ strs: [String]) -> String {
    var index = 0
    var minLength = Int.max
    for str in strs {
      minLength = min(minLength, str.count)
    }
    if strs.count == 0 {
      return ""
    }
    if strs.count == 1 {
      return strs.first!
    }
    
    while index < minLength {
      var set = Set<Character>()
      for str in strs {
        set.insert(str[index])
        if set.count > 1 {
          return output(strs.first, to: index)
        }
      }
      if set.count > 1 {
        return output(strs.first, to: index)
      }
      index += 1
    }
    return output(strs.first, to: index)
  }
}

let s = Solution()
s.longestCommonPrefix(["flower","flow","flight"])
s.longestCommonPrefix(["dog","racecar","car"])
s.longestCommonPrefix([])
