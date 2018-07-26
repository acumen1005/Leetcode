//
//
// https://leetcode.com/problems/3sum-closest/description/
//
// 16. 3Sum Closest
//
//
//Given an array nums of n integers and an integer target, find three integers in nums such that the sum is closest to target. Return the sum of the three integers. You may assume that each input would have exactly one solution.
//
//Example:
//
//Given array nums = [-1, 2, 1, -4], and target = 1.
//
//The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).

class Solution {
  func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
    if nums.count < 3 { return 0 }
    var nums = nums.sorted()
    var closestTarget = Int.max
    var result = 0
    
    for i in 0 ..< nums.count {
      if i >= 1 && nums[i] == nums[i - 1] { continue }
      var left = i + 1
      var right = nums.count - 1
      while left < right {
        if nums[left] + nums[right] + nums[i] == target {
          return target
        } else {
          let distance = abs(nums[left] + nums[right] + nums[i] - target)
          if distance < closestTarget {
            closestTarget = distance
            result = nums[left] + nums[right] + nums[i]
          }
          if nums[left] + nums[right] + nums[i] > target {
            while left < right && nums[right] == nums[right - 1] {
              right = right - 1
            }
            right = right - 1
          } else {
            while left < right && nums[left] == nums[left + 1] {
              left = left + 1
            }
            left = left + 1
          }
        }
      }
    }
    return result
  }
}

let s = Solution()
//[0,2,1,-3]
s.threeSumClosest([0,2,1,-3], 1) // 0
s.threeSumClosest([0, 0, 0], 1)
s.threeSumClosest([-1, 2, 1, -4], 2)
s.threeSumClosest([-1, 2, 1, -4], 1)
s.threeSumClosest([1, 1, 1, 0], -100) // 2
