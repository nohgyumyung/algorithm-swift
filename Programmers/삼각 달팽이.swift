// https://programmers.co.kr/learn/courses/30/lessons/68645

import Foundation

func solution(_ n: Int) -> [Int] {
    var arr = [[Int]]()
    let limit = (1...n).reduce(0, +)
    var (row, col) = (0, 0)
    var num = 2
    
    for i in 1...n {
        arr.append(Array(repeating: 0, count: i))
    }
    
    arr[0][0] = 1
    
    while num <= limit {
        // 아래로 이동
        while row + 1 < n {
            if arr[row + 1][col] == 0 {
                arr[row + 1][col] = num
                row += 1
                num += 1
            } else {
                break
            }
        }
        
        // 오른쪽으로 이동
        while (col + 1) < n {
            if arr[row][col + 1] == 0 {
                arr[row][col + 1] = num
                col += 1
                num += 1
            } else {
                break
            }
        }
        
        // 위, 왼쪽으로 이동
        while (row - 1) >= 0 && (col - 1) >= 0 {
            if arr[row - 1][col - 1] == 0 {
                arr[row - 1][col - 1] = num
                row -= 1
                col -= 1
                num += 1
            } else {
                break
            }
        }
    }
    
    return arr.flatMap({ $0 })
}