// https://www.acmicpc.net/problem/14502

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])

var virus = [(Int, Int)]()
var empty = [(Int, Int)]()
var graph = [[Int]]()

for i in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph.append(input)
    
    for j in 0..<m {
        if input[j] == 2 {
            virus.append((i, j))
        } else if input[j] == 0 {
            empty.append((i, j))
        }
    }
}

// 상, 하, 좌, 우
let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

// 영역의 크기 구하기
func getArea(graph: [[Int]]) -> Int {
    var total = 0
    
    for i in 0..<n {
        for j in 0..<m {
            if graph[i][j] == 0 {
                total += 1
            }
        }
    }
    
    return total
}

// BFS 알고리즘을 이용해 바이러스 퍼트리기
func bfs(graph: inout [[Int]], virus: [(Int, Int)]) -> Int {
    var queue = virus
    
    while !queue.isEmpty {
        let node = queue.removeFirst()
        let (curX, curY) = (node.0, node.1)
        
        for i in 0..<4 {
            let x = curX + dx[i]
            let y = curY + dy[i]
            
            if x < 0 || x >= n || y < 0 || y >= m {
                continue
            }
            
            if graph[x][y] == 0 {
                graph[x][y] = 2
                queue.append((x, y))
            }
        }
    }
    
    return getArea(graph: graph)
}

// 모든 경우의 수에 대해 3개의 벽을 세운 후 최대 영역 구하기
var result = 0

for i in 0..<empty.count - 2 {
    for j in i + 1..<empty.count - 1 {
        for k in j + 1..<empty.count {
            var newGraph = graph
            newGraph[empty[i].0][empty[i].1] = 1
            newGraph[empty[j].0][empty[j].1] = 1
            newGraph[empty[k].0][empty[k].1] = 1
            
            let area = bfs(graph: &newGraph, virus: virus)
            result = max(result, area)
        }
    }
}

print(result)