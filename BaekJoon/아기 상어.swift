// https://www.acmicpc.net/problem/16236

import Foundation

func getFishPos(_ pos: (Int, Int), _ size: Int, _ graph: [[Int]]) -> (Int, Int, Int) {
    // 상, 하, 좌, 우로 움직일 변수
    let dx = [0, 0, 1, -1]
    let dy = [1, -1, 0, 0]
    
    // 방문 여부를 담을 변수
    let len = graph.count
    
    var visited = Array(repeating: Array(repeating: false, count: len), count: len)
    visited[pos.0][pos.1] = true
    
    // 먹을 수 있는 물고기들 정보를 담은 배열과 다음으로 갈 수 있는 위치들의 배열
    var fish = [(Int, Int, Int)]()
    var queue = [(0, pos.0, pos.1)]
    
    while !queue.isEmpty {
        // 현재까지 걸린 시간과 현재 위치
        let (s, x, y) = queue.removeFirst()
        
        // 현재 위치에서 상, 하, 좌, 우 확인
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            // 공간을 벗어난다면
            if nx < 0 || nx >= len || ny < 0 || ny >= len {
                continue
            }
            
            // 아기 상어보다 큰 물고기가 존재하지 않고 방문하지 않았다면 queue에 추가
            if graph[nx][ny] <= size && !visited[nx][ny] {
                queue.append((s + 1, nx, ny))
                visited[nx][ny] = true
                // 아기 상어보다 크기가 작은 물고기가 있다면 fish에 추가
                if graph[nx][ny] != 0 && graph[nx][ny] != size {
                    fish.append((s + 1, nx, ny))
                }
            }
        }
    }
    
    // 다음 먹을 물고기가 없다면 처음 위치 반환
    if fish.isEmpty {
        return (0, pos.0, pos.1)
    } else {
        // 물고기들을 시간 > x > y 순으로 정렬 후 첫 물고기 정보 반환
        fish.sort(by: <)
        return (fish[0].0, fish[0].1, fish[0].2)
    }
}

// 아기 상어의 위치, 크기, 먹은 물고기 수
var pos = (0, 0)
var size = 2
var eaten = 0

// 공간의 크기 입력 받기
let N = Int(readLine()!)!

// 공간 정보 입력 받기
var graph = [[Int]]()
for i in 0..<N {
    let tmp = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph.append(tmp)
    // 상어의 처음 위치
    for j in 0..<N {
        if tmp[j] == 9 {
            pos = (i, j)
        }
    }
}

// 물고기를 잡아먹을 수 있는 시간
var result = 0

while true {
    // 다음 물고기를 먹는데 걸린 시간과 물고기 위치
    let (s, x, y) = getFishPos(pos, size, graph)
    
    // 더 이상 먹을 물고기가 없다면
    if (x, y) == pos {
        break
    }
    
    // 아기 상어가 크기만큼 물고기를 먹었다면 사이즈 업
    eaten += 1
    if eaten == size {
        size += 1
        eaten = 0
    }
    
    // 아기 상어와 물고기 위치 변경
    graph[x][y] = 9
    graph[pos.0][pos.1] = 0
    pos = (x, y)
    
    // 물고기를 먹는데 걸린 시간 추가
    result += s
}

print(result)
