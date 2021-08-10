// https://programmers.co.kr/learn/courses/30/lessons/42889

import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var challenged = Array(repeating: 0, count: N + 2)
    var result: [Int: Double] = [:]

    for stage in stages {
        for i in 1...stage {
            challenged[i] += 1
        }
    }
    
    for i in 1...N {
        result[i] = Double(challenged[i] - challenged[i + 1]) / Double(challenged[i])
    }
    
    return result.sorted { $0.key < $1.key }.sorted { $0.value > $1.value }.map { $0.key }
}