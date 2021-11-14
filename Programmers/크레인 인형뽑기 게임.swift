// https://programmers.co.kr/learn/courses/30/lessons/64061

import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var board = board
    var basket = [-1]
    var result = 0
    
    for move in moves {
        for i in board.indices {
            if board[i][move - 1] != 0 {
                if basket.last! == board[i][move - 1] {
                    basket.removeLast()
                    result += 2
                } else {
                    basket.append(board[i][move - 1])
                }
                
                board[i][move - 1] = 0
                break
            }
        }
    }
    
    return result
}