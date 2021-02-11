// https://programmers.co.kr/learn/courses/30/lessons/70128

import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    var sum = 0
    
    for i in 0..<a.count {
        sum += a[i] * b[i]
    }
    
    return sum
}