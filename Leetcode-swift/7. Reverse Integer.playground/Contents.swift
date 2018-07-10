//: Playground - noun: a place where people can play

// https://leetcode.com/problems/reverse-integer/description/
//
// 7. Reverse Integer

// 用库函数太水，todo：不用库函数显示

//Given a 32-bit signed integer, reverse digits of an integer.
//
//Example 1:
//
//Input: 123
//Output: 321
//Example 2:
//
//Input: -123
//Output: -321
//Example 3:
//
//Input: 120
//Output: 21
//Note:
//Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. For the purpose of this problem, assume that your function returns 0 when the reversed integer overflows.


import Foundation

class Solution {
  
  func reverse(_ x: Int) -> Int {
    if x < 0 {
      let ans = -Int(String("\(-x)".reversed()))!
      return ans < -Int32.max ? 0 : ans
    } else {
      let ans = Int(String("\(x)".reversed()))!
      return ans <= (Int32.max - 1) ? ans : 0
    }
  }
}

let s = Solution()

s.reverse(-123) < -Int32.max ? 0 : s.reverse(-123)
s.reverse(-123)
s.reverse(-15342364611)
s.reverse(1534236469)

