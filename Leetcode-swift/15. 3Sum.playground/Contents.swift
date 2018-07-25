//
//
// https://leetcode.com/problems/3sum/description/
//
// 15. 3Sum
//
//Given an array nums of n integers, are there elements a, b, c in nums such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.
//
//Note:
//
//The solution set must not contain duplicate triplets.
//
//Example:
//
//Given array nums = [-1, 0, 1, 2, -1, -4],
//
//A solution set is:
//[
//[-1, 0, 1],
//[-1, -1, 2]
//]

// a+b=-c

//class Solution {
//
//  func unique(_ nums: [[Int]]) -> [[Int]] {
//    var result = [[Int]]()
//    for num in nums {
//      if !result.contains(num) {
//        result.append(num)
//      }
//    }
//    return result
//  }
//
//  func threeSum(_ nums: [Int]) -> [[Int]] {
//    if nums.count < 3 {
//      return []
//    }
//    let nums = nums.sorted()
//    var result = [[Int]]()
//    var dict = [Int: Int]()
//    var indexs = [Int: Int]()
//    var set = Set<Int>()
//
//    var index = 0
//    for num in nums {
//      if let count = dict[num] {
//        dict[num] = count + 1
//      } else {
//        dict[num] = 1
//      }
//      indexs[num] = index
//      index += 1
//    }
//
//    for i in 0 ..< nums.count - 2 {
//      if i > 1 && nums[i - 1] == nums[i] { continue }
//      set.removeAll()
//      for j in (i + 1) ..< nums.count - 1 {
//        if set.contains(nums[j]) { continue }
//        let sum = nums[i] + nums[j]
//        if let ans = dict[-sum], ans > 0, indexs[-sum]! > j {
//          result.append([nums[i], nums[j], -sum])
//          set.insert(nums[j])
//        }
//      }
//    }
//    return unique(result)
//  }
//}

class Solution {

  func threeSum(_ nums: [Int]) -> [[Int]] {
    if nums.count < 3 {
      return []
    }
    let nums = nums.sorted()
    var result = [[Int]]()

    for i in 0 ..< nums.count {
      if i >= 1 && nums[i - 1] == nums[i] { continue }
      var left = i + 1
      var right = nums.count - 1
      while left < right {
        if nums[left] + nums[right] == -nums[i] {
          result.append([nums[left], nums[right], nums[i]])
          while left < right && nums[left] == nums[left + 1] {
            left = left + 1
          }
          while left < right && nums[right] == nums[right - 1] {
            right = right - 1
          }
          left = left + 1
          right = right - 1
        } else if nums[left] + nums[right] > -nums[i] {
          right = right - 1
        } else {
          left = left + 1
        }
      }
    }
    return result
  }
}

let s = Solution()

s.threeSum([0,0,0,0])
//s.threeSum([-2,0,0,2,2])
//s.threeSum([-1, 0, 1, 2, -1, -4])

// -4 -1 -1 0 1 2
