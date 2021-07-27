// https://www.acmicpc.net/problem/18352

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, M, K, X) = (input[0], input[1], input[2], input[3])

var graph = Array(repeating: [Int](), count: N+1)

for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (x, y) = (input[0], input[1])
    graph[x].append(y)
}

func bfs() {
    var queue = [X]
    distance[X] = 0

    while !queue.isEmpty {
        if distance[queue[0]] == K {
            for i in queue.sorted() {
                print(i)
            }
            return
        }

        let node = queue.removeFirst()

        for i in graph[node] {
            if distance[i] == -1 {
                queue.append(i)
                distance[i] = distance[node] + 1
            }
        }
    }

    print(-1)
}

var distance = Array(repeating: -1, count: N+1)
bfs()