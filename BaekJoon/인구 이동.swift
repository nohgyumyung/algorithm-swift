// https://www.acmicpc.net/problem/16234

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (N, L, R) = (input[0], input[1], input[2])

var countries = [[Int]]()
for _ in 0..<N {
    countries.append(readLine()!.split(separator: " ").map { Int($0)! })
}

let dx = [0, 0, 1, -1]
let dy = [1, -1, 0, 0]

var day = 0

while true {
    var visited = Array(repeating: Array(repeating: false, count: N), count: N)
    var unionCnt = 0
    
    for i in 0..<N {
        for j in 0..<N {
            if visited[i][j] {
                continue
            }
            
            visited[i][j] = true
            
            var sum = 0
            var union = [(Int, Int)]()
            var queue = [(i, j)]
            
            while !queue.isEmpty {
                let (x, y) = queue.removeFirst()
                union.append((x, y))
                sum += countries[x][y]
                
                for idx in 0..<4 {
                    let nx = x + dx[idx]
                    let ny = y + dy[idx]
                    
                    if nx < 0 || nx >= N || ny < 0 || ny >= N {
                        continue
                    }
                    
                    let diff = abs(countries[x][y] - countries[nx][ny])
                    if diff >= L && diff <= R && !visited[nx][ny] {
                        visited[nx][ny] = true
                        queue.append((nx, ny))
                    }
                }
            }
            
            for (x, y) in union {
                countries[x][y] = sum / union.count
            }
            
            unionCnt += 1
        }
    }
    
    if unionCnt == N * N {
        break
    }
    
    day += 1
}

print(day)