// https://programmers.co.kr/learn/courses/30/lessons/12911

import Foundation

func solution(_ n: Int) -> Int {
   let ones = String(n, radix: 2).filter { $0 == "1" }.count
   var num = n + 1

   while true {
       if String(num, radix: 2).filter({ $0 == "1" }).count == ones {
           break
       }

       num += 1
   }

   return num
}