//
//209. Minimum Size Subarray Sum
//
//Given an array of n positive integers and a positive integer s, find the minimal length of a contiguous subarray of which the sum ≥ s. If there isn't one, return 0 instead.
//
//Example:
//
//Input: s = 7, nums = [2,3,1,2,4,3]
//Output: 2
//Explanation: the subarray [4,3] has the minimal length under the problem constraint.
//Follow up:
//If you have figured out the O(n) solution, try coding another solution of which the time complexity is O(n log n).
//
//
//
//
//https://leetcode.com/problems/minimum-size-subarray-sum/
//
//


class Solution {
  
  func binSearch(_ t: Int, _ nums: [Int], _ left: Int, _ right: Int) -> Int {
    
    var l = left
    var r = right
    let base = nums[left]
    
    while l <= r {
      let mid = (l + r) / 2
      if nums[mid] - base < t {
        l = mid + 1
      } else {
        r = mid - 1
      }
    }
    return l
  }
  
  func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
    let arraySize = nums.count
    let maxBounds = arraySize + 1
    var prefixSums = (0 ..< maxBounds).map { _ -> Int in
      return 0
    }
    var total = 0
    for (index, num) in nums.enumerated() {
      prefixSums[index + 1] = prefixSums[index] + num
      total += num
    }
    prefixSums[maxBounds - 1] = total
    
    var minLength = maxBounds
    for i in (0 ..< maxBounds) {
      let right = binSearch(s, prefixSums, i, maxBounds - 1)
      if right >= maxBounds {
        continue
      }
      minLength = min(right - i, minLength)
    }
    minLength = minLength == maxBounds ? 0 : minLength
    return minLength
  }
}

extension Solution {
  
  func debug(nums: [Int]) {
    for (index, num) in nums.enumerated() {
      print("index: \(index), num: \(num)")
    }
  }
  
  func gen() -> [Int] {
    return (0 ..< 1000).map { _ -> Int in
      return 1
    }
  }
}

let s = Solution()
s.minSubArrayLen(3, [1,1])
s.minSubArrayLen(7, [2,3,1,2,4,3])
s.minSubArrayLen(7, [2,1,3,2,4,2])
s.minSubArrayLen(1, [1,2,3])
s.minSubArrayLen(12, [1,2,3,4,5,10])
s.minSubArrayLen(2, [1,1])
s.minSubArrayLen(1000, s.gen())

//s.binSearch(7, [0,0,3,4,6,10,13], 1, 6)
