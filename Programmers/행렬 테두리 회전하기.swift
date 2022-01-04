// https://programmers.co.kr/learn/courses/30/lessons/77485

import Foundation

func solution(_ rows: Int, _ columns: Int, _ queries: [[Int]]) -> [Int] {
    var arr = Array(repeating: Array(repeating: 0, count: columns), count: rows)
    var result = [Int]()
    
    // 행렬 초기화
    for i in 0..<columns {
        for j in 0..<rows {
            arr[j][i] = (j * columns) + i + 1
        }
    }
    
    // 시계방향 로직 수행
    for query in queries {
        let (r1, c1, r2, c2) = (query[0] - 1, query[1] - 1, query[2] - 1, query[3] - 1)
        var tmp = arr[r1 + 1][c1]
        var minNum = tmp
        
        // 오른쪽
        for j in c1..<c2 {
            minNum = min(minNum, arr[r1][j])
            (tmp, arr[r1][j]) = (arr[r1][j], tmp)
        }
        
        // 아래
        for i in r1..<r2 {
            minNum = min(minNum, arr[i][c2])
            (tmp, arr[i][c2]) = (arr[i][c2], tmp)
        }
        
        // 왼쪽
        for j in stride(from: c2, to: c1, by: -1) {
            minNum = min(minNum, arr[r2][j])
            (tmp, arr[r2][j]) = (arr[r2][j], tmp)
        }
        
        // 위
        for i in stride(from: r2, to: r1, by: -1) {
            minNum = min(minNum, arr[i][c1])
            (tmp, arr[i][c1]) = (arr[i][c1], tmp)
        }
        
        result.append(minNum)
    }
    
    return result
}