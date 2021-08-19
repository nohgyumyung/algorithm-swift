// https://www.acmicpc.net/problem/3190

import Foundation

// 보드의 크기 입력 받기
let n = Int(readLine()!)!

// 사과의 위치와 뱀의 방향 정보를 담을 변수
var apple = [(x: Int, y: Int)]()
var direcitons = [(s: Int, dir: String)]()

// 사과의 위치 입력 받기
let k = Int(readLine()!)!
for _ in 0..<k {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    apple.append((input[0], input[1]))
}

// 뱀이 움직여야 할 방향 정보들 입력 받기
let l = Int(readLine()!)!
for _ in 0..<l {
    let input = readLine()!.split(separator: " ").map { String($0) }
    direcitons.append((Int(input[0])!, input[1]))
}

// 뱀의 방향을 바꿀 변수들 (오른쪽으로 돌면 오른쪽 인덱스로, 왼쪽으로 돌면 왼쪽 인덱스로)
let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]

// 뱀의 현재 방향과 위치 정보
var snake = [(1, 1)]
var snakeDir = 0

// 게임이 진행된 시간
var sec = 0

// 게임이 종료될때까지 이동
while true {
    // 뱀의 방향 바꾸기
    if direcitons.contains(where: { $0.s == sec }) {
        if direcitons[0].dir == "D" {
            snakeDir = (snakeDir + 1) % 4
        } else {
            snakeDir = (snakeDir + 3) % 4
        }

        direcitons.removeFirst()
    }

    // 뱀이 가야할 다음 칸
    let (x, y) = snake.last!

    let nx = x + dx[snakeDir]
    let ny = y + dy[snakeDir]

    // 벽에 부딪히는 경우 게임 종료
    if nx < 1 || nx > n || ny < 1 || ny > n {
        break
    }

    // 뱀의 몸에 부딪히는 경우 게임 종료
    if snake.contains(where: { $0 == (nx, ny) }) {
        break
    }

    // 뱀을 움직이고 위치 정보 업데이트
    snake.append((nx, ny))

    // 해당 칸에 사과가 있는 경우 사과 제거, 없는 경우 꼬리를 앞으로
    if apple.contains(where: { $0 == (nx, ny) }) {
        apple = apple.filter { $0 != (nx, ny) }
    } else {
        snake.removeFirst()
    }

    sec += 1
}

print(sec + 1)