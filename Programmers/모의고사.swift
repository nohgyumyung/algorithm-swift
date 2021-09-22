// https://programmers.co.kr/learn/courses/30/lessons/42840

import Foundation

func solution(_ answers:[Int]) -> [Int] {
    let p1 = [1, 2, 3, 4, 5]
    let p2 = [2, 1, 2, 3, 2, 4, 2, 5]
    let p3 = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    
    var correct = ["1": 0, "2": 0, "3": 0]
    
    for (i, v) in answers.enumerated() {
        if v == p1[i % p1.count] { correct["1"]! += 1 }
        if v == p2[i % p2.count] { correct["2"]! += 1 }
        if v == p3[i % p3.count] { correct["3"]! += 1 }
    }
    
    let highest = correct.values.max()
    let result = correct.filter({ $0.value == highest }).map({ Int($0.key)! }).sorted()

    return result
}