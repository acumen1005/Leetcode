//
// https://leetcode.com/problems/4sum/description/
//
// 18. 4Sum
//
//
//Given an array nums of n integers and an integer target, are there elements a, b, c, and d in nums such that a + b + c + d = target? Find all unique quadruplets in the array which gives the sum of target.
//
//Note:
//
//The solution set must not contain duplicate quadruplets.
//
//Example:
//
//Given array nums = [1, 0, -1, 0, -2, 2], and target = 0.
//
//A solution set is:
//[
//[-1,  0, 0, 1],
//[-2, -1, 1, 2],
//[-2,  0, 0, 2]
//]

class Solution {
  func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
    let sorted = nums.sorted()
    var result = [[Int]]()
    
    if sorted.count < 4 {
      return []
    }
    
    for i in 0 ..< sorted.count - 3 {
      if i >= 1 && sorted[i] == sorted[i - 1] { continue }
      for j in (i + 1) ..< sorted.count {
        if j > (i + 1) && sorted[j] == sorted[j - 1] { continue }
        var left = j + 1
        var right = sorted.count - 1
        while left < right {
          if sorted[left] + sorted[right] + sorted[i] + sorted[j] == target {
            result.append([sorted[i], sorted[j], sorted[left], sorted[right]])
            while left < right && sorted[left] == sorted[left + 1] {
              left = left + 1
            }
            while left < right && sorted[right] == sorted[right - 1] {
              right = right - 1
            }
            left = left + 1
            right = right - 1
          } else if sorted[left] + sorted[right] + sorted[i] + sorted[j] > target {
            right = right - 1
          } else {
            left = left + 1
          }
        }
      }
    }
    return result
  }
}

let s = Solution()
s.fourSum([1, 0, -1, 0, -2, 2], 0)
s.fourSum([-1, -1, -1, -1, 3, 0], 1)
s.fourSum([-1,0,1,2,-1,-4], -1)
s.fourSum([-1, -1, -1, -1, 3, 0], 0)
s.fourSum([-2, -1, -4, 1, 3, 0, 0], -3)
s.fourSum([0, 0, 0, 0], 0)

//[[-4,0,1,2],[-1,-1,0,1]]
