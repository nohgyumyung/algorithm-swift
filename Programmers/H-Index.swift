// https://programmers.co.kr/learn/courses/30/lessons/42747

import Foundation

func solution(_ citations:[Int]) -> Int {
   let citations = citations.sorted(by: >)
   var result = 0

   for i in citations.indices {
       if citations[i] < (i + 1) {
           result = i
           break
       } else {
           result = citations.count
       }
   }

   return result
}