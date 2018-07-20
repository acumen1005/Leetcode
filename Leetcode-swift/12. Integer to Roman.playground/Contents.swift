//
//
// 12. Integer to Roman
//
// https://leetcode.com/problems/integer-to-roman/description/
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
//Given an integer, convert it to a roman numeral. Input is guaranteed to be within the range from 1 to 3999.
//
//Example 1:
//
//Input: 3
//Output: "III"
//Example 2:
//
//Input: 4
//Output: "IV"
//Example 3:
//
//Input: 9
//Output: "IX"
//Example 4:
//
//Input: 58
//Output: "LVIII"
//Explanation: C = 100, L = 50, XXX = 30 and III = 3.
//Example 5:
//
//Input: 1994
//Output: "MCMXCIV"
//Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.
//

// 400

extension Character {
  static func + (lhs: Character, rhs: Character) -> String {
    return String(lhs) + String(rhs)
  }
}

class Solution {
  
  let digistOneMap: [Int: Character] = [1: Character("I"), 2: Character("X"), 3: Character("C"), 4: Character("M")]
  let digistFiveMap: [Int: Character] = [1: Character("V"), 2: Character("L"), 3: Character("D")]
  
  func renderSubtraction(digist: Int, at loop: Int) -> String {
    return String((0 ..< loop).map { _ -> Character in
      return digistOneMap[digist]!
    })
  }
  
  func intToRoman(_ num: Int) -> String {
    var number = num
    var result = [String]()
    var count = 1
    
    while number > 0 {
      let digist = number % 10
      var tmp = ""
      if digist == 9 {
        tmp = digistOneMap[count]! + digistOneMap[count + 1]!
      } else if digist >= 5 {
        tmp = String(digistFiveMap[count]!) + renderSubtraction(digist: count, at: digist - 5)
      } else if digist == 4 {
        tmp = digistOneMap[count]! + digistFiveMap[count]!
      } else {
        tmp.append(renderSubtraction(digist: count, at: digist))
      }
      
      result.append(tmp)
      count += 1
      number /= 10
    }
    return [String](result.reversed()).reduce("") { (result, str) -> String in
      return result + str
    }
  }
}

let s = Solution()
s.intToRoman(3324)
s.intToRoman(3)
s.intToRoman(10)
s.intToRoman(11)
s.intToRoman(60)
s.intToRoman(90)
s.intToRoman(4)
s.intToRoman(9)
s.intToRoman(58)
s.intToRoman(1994)
"MCMXCIV"
