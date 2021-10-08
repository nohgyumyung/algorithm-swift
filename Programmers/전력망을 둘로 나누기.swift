// https://programmers.co.kr/learn/courses/30/lessons/86971

import Foundation

func bfs(_ graph: [[Int]], _ node1: Int, _ node2: Int) -> Int {
    var visited = Array(repeating: false, count: graph.count + 1)
    visited[node1] = true
    
    var queue = [node1]
    var count = 1
    
    while !queue.isEmpty {
        let node = queue.removeFirst()
        
        for i in graph[node] {
            if !visited[i] && i != node2 {
                visited[i] = true
                queue.append(i)
                count += 1
            }
        }
    }
    
    return count
}

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    var graph = Array(repeating: [Int](), count: n + 1)
    var result = n
    
    for wire in wires {
        graph[wire[0]].append(wire[1])
        graph[wire[1]].append(wire[0])
    }
    
    for wire in wires {
        let a = bfs(graph, wire[0], wire[1])
        let b = n - a
        
        result = min(result, abs(a - b))
    }
    
    return result
}