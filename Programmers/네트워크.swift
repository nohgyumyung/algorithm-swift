// // https://programmers.co.kr/learn/courses/30/lessons/43162

import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var visited = Array(repeating: false, count: n)
    var result = 0

    for i in 0..<n {
        if visited[i] {
            continue
        }

        var queue = [i]
        visited[i] = true

        while !queue.isEmpty {
            let node = queue.removeFirst()

            for j in 0..<n {
                if !visited[j] && computers[node][j] == 1 {
                    queue.append(j)
                    visited[j] = true
                }
            }
        }

        result += 1
    }

    return result
}