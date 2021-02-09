// https://programmers.co.kr/learn/courses/30/lessons/68644

import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var result: Array<Int> = []
    let cnt = numbers.count
    
    for i in 0..<cnt-1 {
        for j in i+1..<cnt {
            let sum = numbers[i] + numbers[j]
            if !result.contains(sum) {
                result.append(sum)
            }
        }
    }
    
    return result.sorted()
}