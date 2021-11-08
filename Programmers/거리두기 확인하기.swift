// https://programmers.co.kr/learn/courses/30/lessons/81302

import Foundation

func check(_ candidates: [[Int]], _ obstacles: [[Int]]) -> Bool {
    let dx = [1, -1, 0, 0]
    let dy = [0, 0, 1, -1]
    
    for candidate in candidates {
        var queue = [[candidate[0], candidate[1], 0]]
        var visited = [[candidate[0], candidate[1]]]
        
        while !queue.isEmpty {
            let info = queue.removeFirst()
            let (x, y, d) = (info[0], info[1], info[2])
            
            // 맨해튼 거리를 지키고 있다면 다음 응시자 확인
            if d == 2 {
                break
            }
            
            // 상, 하, 좌, 우 확인
            for i in 0..<4 {
                let nx = x + dx[i]
                let ny = y + dy[i]
                
                // 범위를 벗어나는 경우
                if nx < 0 || nx >= 5 || ny < 0 || ny >= 5 {
                    continue
                }
                
                // 이미 확인했거나 파티션이 존재하는 경우
                if visited.contains([nx, ny]) || obstacles.contains([nx, ny]) {
                    continue
                }
                
                // 다른 응시자가 있다면 맨해튼 거리를 지키고 있지 않음
                if candidates.contains([nx, ny]) {
                    return false
                }
                
                queue.append([nx, ny, d + 1])
                visited.append([nx, ny])
            }
        }
    }
    
    return true
}

func solution(_ places:[[String]]) -> [Int] {
    var result = [Int]()

    for place in places {
        // 응시자와 파티션의 위치 저장
        var candidates = [[Int]]()
        var obstacles = [[Int]]()

        for i in 0..<5 {
            for j in 0..<5 {
                if Array(place[i])[j] == "P" {
                    candidates.append([i, j])
                }
                
                if Array(place[i])[j] == "X" {
                    obstacles.append([i, j])
                }
            }
        }
        
        // 맨해튼 거리를 지키고 있다면 1, 아니라면 0
        if check(candidates, obstacles) {
            result.append(1)
        } else {
            result.append(0)
        }
    }

    return result
}