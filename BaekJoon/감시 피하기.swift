// https://www.acmicpc.net/problem/18428

import Foundation

func combi<T>(_ elements: Array<T>, _ k: Int) -> [[T]] {
    var result = [[T]]()
    
    func combination(_ nowCombi: [T], _ idx: Int) {
        if nowCombi.count == k {
            result.append(nowCombi)
            return
        }
        for i in idx..<elements.count {
            combination(nowCombi + [elements[i]], i + 1)
        }
    }
    
    combination([], 0)
    return result
}

func check(_ room: [[String]], _ teachers: [(Int, Int)]) -> Bool {
    let len = room.count
    let dx = [0, 0, 1, -1]
    let dy = [1, -1, 0, 0]
    
    for t in teachers {
        for i in 0..<4 {
            var x = t.0 + dx[i]
            var y = t.1 + dy[i]
            while true {
                if x < 0 || x >= len || y < 0 || y >= len {
                    break
                }
                if room[x][y] == "O" {
                    break
                }
                if room[x][y] == "S" {
                    return false
                }
                x += dx[i]
                y += dy[i]
            }
        }
    }
    
    return true
}

let n = Int(readLine()!)!

var room = [[String]]()
var teachers = [(Int, Int)]()
var space = [(Int, Int)]()

for i in 0..<n {
    let input = readLine()!.components(separatedBy: " ")
    room.append(input)
    
    for j in 0..<n {
        if input[j] == "T" {
            teachers.append((i, j))
        }
        if input[j] == "X" {
            space.append((i, j))
        }
    }
}

let positions = combi(space, 3)
var result = "NO"

for pos in positions {
    var newRoom = room
    
    for i in pos {
        newRoom[i.0][i.1] = "O"
    }
    
    if check(newRoom, teachers) {
        result = "YES"
        break
    }
}

print(result)