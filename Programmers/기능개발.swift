// https://programmers.co.kr/learn/courses/30/lessons/42586

import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var progresses = progresses
    var speeds = speeds
    var result = [Int]()

    while !progresses.isEmpty {
        var count = 0

        for i in progresses.indices {
            progresses[i] += speeds[i]
        }

        while !progresses.isEmpty {
            if progresses.first! < 100 {
                break
            } else {
                progresses.removeFirst()
                speeds.removeFirst()
                count += 1
            }
        }

        result.append(count)
    }

    return result.filter({ $0 != 0 })
}