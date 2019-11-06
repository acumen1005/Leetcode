//
//
//
//
//210. Course Schedule II
//
//
//
//There are a total of n courses you have to take, labeled from 0 to n-1.
//
//Some courses may have prerequisites, for example to take course 0 you have to first take course 1, which is expressed as a pair: [0,1]
//
//Given the total number of courses and a list of prerequisite pairs, return the ordering of courses you should take to finish all courses.
//
//There may be multiple correct orders, you just need to return one of them. If it is impossible to finish all courses, return an empty array.
//
//Example 1:
//
//Input: 2, [[1,0]]
//Output: [0,1]
//Explanation: There are a total of 2 courses to take. To take course 1 you should have finished
//             course 0. So the correct course order is [0,1] .
//Example 2:
//
//Input: 4, [[1,0],[2,0],[3,1],[3,2]]
//Output: [0,1,2,3] or [0,2,1,3]
//Explanation: There are a total of 4 courses to take. To take course 3 you should have finished both
//             courses 1 and 2. Both courses 1 and 2 should be taken after you finished course 0.
//             So one correct course order is [0,1,2,3]. Another correct ordering is [0,2,1,3] .
//Note:
//
//The input prerequisites is a graph represented by a list of edges, not adjacency matrices. Read more about how a graph is represented.
//You may assume that there are no duplicate edges in the input prerequisites.
//
//
//
//
//https://leetcode.com/problems/course-schedule-ii/
//
//

class Solution {
  
  func topSort(_ num: Int, _ prerequisites: [[Int]]) -> [Int] {
    var du = [[Int]]()
    var queue = [Int]()
    var ans = [Int]()
    var courses = [[Int]]()
    for _ in (0 ..< num) {
      courses.append([])
    }
    for _ in (0 ..< 2) {
      du.append((0 ..< num).map { _ -> Int in
        return 0
      })
    }
    for reqs in prerequisites {
      // 0 入度 1 出度
      for (index, req) in reqs.enumerated() {
        du[index][req] += 1
      }
      let s = reqs[1]
      let d = reqs[0]
      // 存边
      courses[s].append(d)
    }
    for node in (0 ..< num) {
      if du[0][node] == 0 {
        queue.append(node)
      }
    }
    
    while !queue.isEmpty {
      let top = queue.first!
      queue.removeFirst()
      ans.append(top)
      for d in courses[top] {
        du[0][d] -= 1
        if du[0][d] == 0 {
          queue.append(d)
        }
      }
    }
    if ans.count < num {
      return []
    }
    return ans
  }
  
  func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
    let result = topSort(numCourses, prerequisites)
    return result
  }
}


let s = Solution()

s.findOrder(2, [[1, 0]])
s.findOrder(4, [[1,0],[2,0],[3,1],[3,2]])
s.findOrder(3, [[1,0],[1,2],[0,1]])
