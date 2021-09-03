import Foundation

func getNextPos(_ cur: ((Int, Int), (Int, Int)), _ board: [[Int]]) -> [((Int, Int), (Int, Int))] {
    // 다음으로 갈 수 있는 모든 경우의 수를 담는 변수
    var nextPos = [((Int, Int), (Int, Int))]()

    // 현재 위치와 블록의 크기 변수
    let (x1, y1, x2, y2) = (cur.0.0, cur.0.1, cur.1.0, cur.1.1)
    let n = board.count - 1

    // 상, 하, 좌, 우 방향 변수
    let dx = [-1, 1, 0, 0]
    let dy = [0, 0, -1, 1]

    // 상, 하, 좌, 우로 이동하며 이동 가능한지 확인
    for i in 0..<4 {
        // 이동한 새로운 위치 변수
        let (nx1, ny1, nx2, ny2) = (x1 + dx[i], y1 + dy[i], x2 + dx[i], y2 + dy[i])

        // 블록의 범위를 벗어난 경우
        if nx1 < 0 || nx1 > n || ny1 < 0 || ny1 > n || nx2 < 0 || nx2 > n || ny2 < 0 || ny2 > n {
            continue
        }

        // 이동하려는 칸에 벽이 있는 경우
        if board[nx1][ny1] == 1 || board[nx2][ny2] == 1 {
            continue
        }

        // 이동 가능한 경우의 수
        nextPos.append(((nx1, ny1), (nx2, ny2)))

        // 로봇이 가로 방향이고 위 또는 아래에 벽이 없을때 회전 가능한 수
        if x1 == x2 && i < 2 {
            nextPos.append(((x1, y1), (x1 + dx[i], y1 + dy[i])))
            nextPos.append(((x2 + dx[i], y2 + dy[i]), (x2, y2)))
        }

        // 로봇이 세로 방향이고 왼쪽 또는 오른쪽에 벽이 없을때 회전 가능한 수
        if y1 == y2 && i > 1 {
            nextPos.append(((x1, y1), (x1 + dx[i], y1 + dy[i])))
            nextPos.append(((x2 + dx[i], y2 + dy[i]), (x2, y2)))
        }
    }

    return nextPos
}

func solution(_ board:[[Int]]) -> Int {
    let n = board.count - 1
    var visited = [String: Int]()
    var queue = [(((0, 0), (0, 1)), 0)]

    while !queue.isEmpty {
        // 로봇의 현재 위치와 시간
        let (cur, sec) = queue.removeFirst()

        // 목적지에 도달하면 최소 시간 반환
        if cur.0 == (n, n) || cur.1 == (n, n) {
            return sec
        }
        
        // 다음으로 갈 수 있는 모든 경우의 수로 이동
        let nextPos = getNextPos(cur, board)

        for pos in nextPos {
            let s = "\(pos.0.0) \(pos.0.1) \(pos.1.0) \(pos.1.1)"
            
            // 방문한적 없는 경로로만 이동
            if visited[s] == nil {
                queue.append((pos, sec + 1))
                visited[s] = 1
            }
        }
    }

    return 0
}