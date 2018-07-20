//
//
// 11. Container With Most Water
//
// https://leetcode.com/problems/container-with-most-water/description/
//
//
//Given n non-negative integers a1, a2, ..., an, where each represents a point at coordinate (i, ai). n vertical lines are drawn such that the two endpoints of line i is at (i, ai) and (i, 0). Find two lines, which together with x-axis forms a container, such that the container contains the most water.
//
//Note: You may not slant the container and n is at least 2.

class Solution {
  func maxArea(_ height: [Int]) -> Int {
    let length = height.count
    var result = 0
    var (left, right) = (0, length - 1)
    
    while left < right {
      let tmp = min(height[left], height[right]) * (right - left)
      if result < tmp {
        result = tmp
      }
      if height[left] > height[right] {
        right -= 1
      } else {
        left += 1
      }
    }
    
    return result
  }
}

let s = Solution()

s.maxArea([3, 1, 4])
s.maxArea([3, 1, 4, 5])
s.maxArea([3, 1, 4, 99, 101, 100])
s.maxArea([1, 1, 1, 1])
