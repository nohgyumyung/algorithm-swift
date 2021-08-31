// https://www.acmicpc.net/problem/3665

import Foundation

let testCase = Int(readLine()!)!

for _ in 0..<testCase {
    let n = Int(readLine()!)!
    let rank = readLine()!.split(separator: " ").map { Int($0)! }
    
    var graph = Array(repeating: [Int](), count: n + 1)
    var indegree = Array(repeating: 0, count: n + 1)
    
    for i in 1..<n {
        for j in 0..<i {
            graph[rank[j]].append(rank[i])
            indegree[rank[i]] += 1
        }
    }
    
    let m = Int(readLine()!)!
    
    for _ in 0..<m {
        let pair = readLine()!.split(separator: " ").map { Int($0)! }
        let (a, b) = (pair[0], pair[1])
        
        if graph[a].contains(b) {
            graph[a].remove(at: graph[a].firstIndex(of: b)!)
            graph[b].append(a)
            indegree[a] += 1
            indegree[b] -= 1
        } else {
            graph[b].remove(at: graph[b].firstIndex(of: a)!)
            graph[a].append(b)
            indegree[b] += 1
            indegree[a] -= 1
        }
    }
    
    var cycle = false
    var multiCase = false
    
    var result = [Int]()
    var queue = [Int]()
    
    for i in 1...n {
        if indegree[i] == 0 {
            queue.append(i)
        }
    }
    
    for _ in 0..<n {
        if queue.isEmpty {
            cycle = true
            break
        }
        
        if queue.count == 2 {
            multiCase = true
            break
        }
        
        let now = queue.removeFirst()
        result.append(now)
        
        for node in graph[now] {
            indegree[node] -= 1
            if indegree[node] == 0 {
                queue.append(node)
            }
        }
    }
    
    if cycle {
        print("IMPOSSIBLE")
    } else if multiCase {
        print("?")
    } else {
        print(result.map { String($0) }.joined(separator: " "))
    }
}