// https://programmers.co.kr/learn/courses/30/lessons/84021

import Foundation

func findShape(_ board: inout [[Int]], _ x: Int, _ y: Int, _ kind: String) -> [(Int, Int)] {
    let empty = kind == "board" ? 0 : 1
    let fill = kind == "board" ? 1 : 0

    let dx = [1, -1, 0, 0]
    let dy = [0, 0, 1, -1]

    var pieces = [(Int, Int)]()
    var queue = [(x, y)]

    board[x][y] = fill

    while !queue.isEmpty {
        let (x, y) = queue.removeFirst()
        pieces.append((x, y))

        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]

            if nx < 0 || nx >= board.count || ny < 0 || ny >= board.count {
                continue
            }

            if board[nx][ny] == empty {
                queue.append((nx, ny))
                board[nx][ny] = fill
            }
        }
    }

    return pieces
}

func moveToLeftTop(_ pieces: [(Int, Int)]) -> [(Int, Int)] {
    var newPieces = [(Int, Int)]()
    
    let minX = pieces.map { $0.0 }.min()!
    let minY = pieces.map { $0.1 }.min()!
    
    for piece in pieces {
        newPieces.append((piece.0 - minX, piece.1 - minY))
    }
    
    return newPieces
}

func rotate90(_ puzzle: [(Int, Int)], _ len: Int) -> [(Int, Int)] {
    var puzzle90 = [(Int, Int)]()

    for piece in puzzle {
        puzzle90.append((piece.1, len - 1 - piece.0))
    }

    return puzzle90
}

func fit(_ spaces: inout [[(Int, Int)]], _ puzzle: [(Int, Int)]) -> Bool {
    let puzzle = puzzle.map { "\($0.0) \($0.1)" }
    
    for i in spaces.indices {
        let space = spaces[i].map { "\($0.0) \($0.1)" }
        
        if Set(puzzle) == Set(space) {
            spaces.remove(at: i)
            return true
        }
    }
    
    return false
}

func solution(_ game_board:[[Int]], _ table:[[Int]]) -> Int {
    var board = game_board
    var table = table
    var result = 0

    var spaces = [[(Int, Int)]]()
    var puzzles = [[(Int, Int)]]()

    for i in board.indices {
        for j in board.indices {
            if board[i][j] == 0 {
                var space = findShape(&board, i, j, "board")
                space = moveToLeftTop(space)
                spaces.append(space)
            }
        }
    }

    for i in table.indices {
        for j in table.indices {
            if table[i][j] == 1 {
                var puzzle = findShape(&table, i, j, "table")
                puzzle = moveToLeftTop(puzzle)
                puzzles.append(puzzle)
            }
        }
    }
    
    for puzzle in puzzles {
        var puzzle90 = puzzle
        
        for _ in 0..<4 {
            puzzle90 = rotate90(puzzle90, board.count)
            puzzle90 = moveToLeftTop(puzzle90)
            
            if fit(&spaces, puzzle90) {
                result += puzzle.count
                break
            }
        }
    }
    
    return result
}