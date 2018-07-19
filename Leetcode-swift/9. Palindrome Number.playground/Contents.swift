//
// https://leetcode.com/problems/palindrome-number/description/
//
// 9. Palindrome Number
//
//Determine whether an integer is a palindrome. An integer is a palindrome when it reads the same backward as forward.
//
//Example 1:
//
//Input: 121
//Output: true
//Example 2:
//
//Input: -121
//Output: false
//Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
//Example 3:
//
//Input: 10
//Output: false
//Explanation: Reads 01 from right to left. Therefore it is not a palindrome.
//Follow up:
//
//Coud you solve it without converting the integer to a string?


class Solution {
  
  func lengthFor10(_ x: Int) -> Int {
    var count = 0
    var tmp = x
    while tmp > 0 {
      tmp /= 10
      count += 1
    }
    return count
  }
  
  func powFor10(_ p: Int) -> Int {
    if p < 0 { return 1 }
    var result = 1
    for _ in 0 ..< p {
      result *= 10
    }
    return result
  }
  
  func index(_ x: Int, at p: Int) -> Int {
    let mod = powFor10(p)
    let d = powFor10(p - 1)
    return (x % mod) / d
  }
 
  func isPalindrome(_ x: Int) -> Bool {
    if x < 0 { return false }
    let length = lengthFor10(x)
    var (left, right) = length % 2 == 0 ? (length/2-1, length/2) : (length/2-1, length/2+1)
    while left >= 0 && right < length {
      if index(x, at: left + 1) != index(x, at: right + 1) {
        return false
      }
      left -= 1
      right += 1
    }
    return true
  }
}

let s = Solution()

print(s.isPalindrome(1234))
print(s.isPalindrome(1211))
print(s.isPalindrome(1))
print(s.isPalindrome(-11))
print(s.isPalindrome(123321))
print(s.isPalindrome(10))

