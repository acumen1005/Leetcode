//
//
// https://leetcode.com/problems/zigzag-conversion/description/
//
// 6. ZigZag Conversion
//
//The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)
//
//P   A   H   N
//A P L S I I G
//Y   I   R
//And then read line by line: "PAHNAPLSIIGYIR"
//
//Write the code that will take a string and make this conversion given a number of rows:
//
//string convert(string s, int numRows);
//Example 1:
//
//Input: s = "PAYPALISHIRING", numRows = 3
//Output: "PAHNAPLSIIGYIR"
//Example 2:
//
//Input: s = "PAYPALISHIRING", numRows = 4
//Output: "PINALSIGYAHRPI"
//Explanation:
//
//P     I    N
//A   L S  I G
//Y A   H R
//P     I

class Solution {
  func convert(_ s: String, _ numRows: Int) -> String {
    if numRows == 1 { return s }
    if numRows == 0 { return "" }
    
    let charactors = [Character](s)
    
    let length = charactors.count
    var result = ""
    let maxSeg = (numRows - 1) * 2
    
    for y in 0 ..< numRows {
      var seg = (numRows - y - 1) * 2
      if seg == 0 { seg = maxSeg }
      var x = 0
      while y + maxSeg * x - (maxSeg - seg) < length {
        let index = y + maxSeg * x - (maxSeg - seg)
        let newIndex = y + maxSeg * x
        if index >= 0 && y > 0 && y < (numRows - 1) {
          result.append(charactors[index])
        }
        if newIndex < charactors.count {
          result.append(charactors[newIndex])
        }
        x += 1
      }
    }
    
    return result
  }
}

let s = Solution()
s.convert("PAYPALISHIRING", 5)
s.convert("abcdef", 3)
s.convert("a", 1)

//a   e
//b d f
//c
//


//P     I    N
//A   L S  I G
//Y A   H R
//P     I

//0    6     12
//1  5 7  11 13
//2 4  8 10
//3    9

//P     H
//A   S I
//Y  I  R
//P L   I G
//A     N

//0     8       16
//1   7 9    15 17
//2  6  10  14  18
//3 5   11 13   19
//4     12      20

//P   A   H   N
//A P L S I I G
//Y   I   R

//0   4   8    12
//1 3 5 7 9 11 13
//2   6   10
