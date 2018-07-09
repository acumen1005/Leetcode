//: Playground - noun: a place where people can play

//4. Median of Two Sorted Arrays
//
//https://leetcode.com/problems/median-of-two-sorted-arrays/description/
//
//There are two sorted arrays nums1 and nums2 of size m and n respectively.
//
//Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).
//

class Solution {
  
  func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    let count = nums1.count + nums2.count
    var nums = [Int]()
    var index1 = 0
    var index2 = 0
    
    if count == 0 {
      return 0
    }
    
    while (index1 < nums1.count && index2 < nums2.count) {
      if nums1[index1] < nums2[index2] {
        nums.append(nums1[index1])
        index1 += 1
      } else {
        nums.append(nums2[index2])
        index2 += 1
      }
    }
    nums.append(contentsOf: nums1[index1 ..< nums1.count])
    nums.append(contentsOf: nums2[index2 ..< nums2.count])
    if count % 2 == 0 {
      return (Double(nums[count/2]) + Double(nums[count/2 - 1])) / 2
    } else {
      return Double(nums[count / 2])
    }
  }
}

let s = Solution()

// 1, 1
// 1, 2
//// 1
//let nums1 = [1, 2]
//let nums2 = [2, 3]
//s.findMedianSortedArrays([1, 2], [3, 4])
//s.findMedianSortedArrays([1], [3, 4])
//s.findMedianSortedArrays([], [3, 4])
//s.findMedianSortedArrays([1], [])
s.findMedianSortedArrays([1, 3], [2])
//s.findMedianSortedArrays([], [])
//s.findMedianSortedArrays([1, 1, 1], [3, 4])
