//: Playground - noun: a place where people can play

//Given a digit string, return all possible letter combinations that the number could represent.
//
//A mapping of digit to letters (just like on the telephone buttons) is given below.
//

class Solution {
  
  let map: [String: [String]] = ["1": [""],
                                 "2": ["a", "b", "c"],
                                 "3": ["d", "e", "f"],
                                 "4": ["g", "h", "i"],
                                 "5": ["j", "k", "l"],
                                 "6": ["m", "n", "o"],
                                 "7": ["p", "q", "r", "s"],
                                 "8": ["t", "u", "v"],
                                 "9": ["w", "x", "y", "z"],
                                 "0": [""]]
  var result = [String]()
  
  func dfs(_ digits: [String], _ depth: Int, _ rs: String) -> Void {
    if depth >= digits.count {
      if !result.contains(rs), !rs.isEmpty {
        result.append(rs)
      }
      return
    }
    
    let mapped = map[digits[depth]]!
    for letter in mapped {
      dfs(digits, depth + 1, rs + "\(letter)")
    }
    return
  }
  
  func letterCombinations(_ digits: String) -> [String] {
    var splits = [String]()
    result.removeAll()
    
    for digit in digits {
      splits.append("\(digit)")
    }
    dfs(splits, 0, "")
    
    return result
  }
}


let s = Solution()
print(s.letterCombinations("23"))
print(s.letterCombinations("123"))
print(s.letterCombinations("6"))

//["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"]
//["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"]




