//
// https://leetcode.com/problems/roman-to-integer/description/
//
// 13. Roman to Integer
//
//Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.
//
//Symbol       Value
//I             1
//V             5
//X             10
//L             50
//C             100
//D             500
//M             1000
//For example, two is written as II in Roman numeral, just two one's added together. Twelve is written as, XII, which is simply X + II. The number twenty seven is written as XXVII, which is XX + V + II.
//
//Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:
//
//I can be placed before V (5) and X (10) to make 4 and 9.
//X can be placed before L (50) and C (100) to make 40 and 90.
//C can be placed before D (500) and M (1000) to make 400 and 900.
//Given a roman numeral, convert it to an integer. Input is guaranteed to be within the range from 1 to 3999.
//
//Example 1:
//
//Input: "III"
//Output: 3
//Example 2:
//
//Input: "IV"
//Output: 4
//Example 3:
//
//Input: "IX"
//Output: 9
//Example 4:
//
//Input: "LVIII"
//Output: 58
//Explanation: C = 100, L = 50, XXX = 30 and III = 3.
//Example 5:
//
//Input: "MCMXCIV"
//Output: 1994
//Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.
//

class Solution {
  
  let digistOneMap: [Character: Int] = [Character("I"): 0, Character("X"): 1, Character("C"): 2, Character("M"): 3]
  let digistFiveMap: [Character: Int] = [Character("V"): 0, Character("L"): 1, Character("D"): 2]
  
  func powTen(_ loop: Int) -> Int {
    var result = 1
    (0 ..< loop).forEach { _ in
      result = result * 10
    }
    return result
  }
  
  func romanToInt(_ s: String) -> Int {
    let characters = [Character](s.reversed())
    var result = 0
    var prefix = -1
    
    for character in characters {
      guard let digist = digistFiveMap[character] else {
        if let digist = digistOneMap[character] {
          if prefix <= powTen(digist) {
            result = result + powTen(digist)
          } else {
            result = result - powTen(digist)
          }
          prefix = powTen(digist)
        }
        continue
      }
      result = result + powTen(digist) * 5
      prefix = powTen(digist) * 5
    }
    
    return result
  }
}


let s = Solution()
s.romanToInt("III")
s.romanToInt("IV")
s.romanToInt("LXIV")
s.romanToInt("MCMXCIV")
s.romanToInt("XCIV")
s.romanToInt("IX")
s.romanToInt("XI")
s.romanToInt("MI")
s.romanToInt("MMMCCCXXIV")

