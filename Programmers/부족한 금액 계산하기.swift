// https://programmers.co.kr/learn/courses/30/lessons/82612

import Foundation

func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64 {
    var total = 0
    
    for i in 1...count {
        total += price * i
    }
    
    return money >= total ? 0 : Int64(total - money)
}