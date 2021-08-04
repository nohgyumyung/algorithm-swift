// https://www.acmicpc.net/problem/11404

import Foundation

let n = Int(String(readLine()!))!
let m = Int(String(readLine()!))!

let INF = Int(1e9)
var distance = Array(repeating: Array(repeating: INF, count: n + 1), count: n + 1)

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (a, b, c) = (input[0], input[1], input[2])
    distance[a][b] = min(distance[a][b], c)
}

for i in 1...n {
    for j in 1...n {
        if i == j {
            distance[i][j] = 0
        }
    }
}

for k in 1...n {
    for i in 1...n {
        for j in 1...n {
            distance[i][j] = min(distance[i][j], distance[i][k] + distance[k][j])
        }
    }
}

for i in 1...n {
    for j in 1...n {
        if distance[i][j] >= INF {
            print(0, terminator: " ")
        } else {
            print(distance[i][j], terminator: " ")
        }
    }
    print()
}
