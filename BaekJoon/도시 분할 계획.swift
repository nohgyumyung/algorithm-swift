// https://www.acmicpc.net/problem/1647

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])

var graph = [(Int, Int, Int)]()
for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (a, b, cost) = (input[0], input[1], input[2])
    graph.append((a, b, cost))
}
graph.sort { $0.2 < $1.2 }

func findParent(of n: Int) -> Int {
    if parent[n] != n {
        parent[n] = findParent(of: parent[n])
    }
    
    return parent[n]
}

func unionParent(a: Int, b: Int) {
    let parentA = findParent(of: a)
    let parentB = findParent(of: b)
    
    if parentA < parentB {
        parent[parentB] = parentA
    } else {
        parent[parentA] = parentB
    }
}

var parent = Array(repeating: 0, count: n + 1)
var edges = [Int]()

for i in 1...n {
    parent[i] = i
}

for (a, b, cost) in graph {
    let parentA = findParent(of: a)
    let parentB = findParent(of: b)
    
    if parentA != parentB {
        unionParent(a: a, b: b)
        edges.append(cost)
    }
}

let result = edges.reduce(0, +) - edges.last!
print(result)