// https://programmers.co.kr/learn/courses/30/lessons/60061

import Foundation

func install(_ x: Int, _ y: Int, _ stuff: Int, _ result: [[Int]]) -> Bool {
    if stuff == 0 {
        let condition1 = y == 0
        let condition2 = result.contains([x, y - 1, 0])
        let condition3 = result.contains([x - 1, y, 1])
        let condition4 = result.contains([x , y, 1])
        
        if !condition1 && !condition2 && !condition3 && !condition4 {
            return false
        }
    } else {
        let condition1 = result.contains([x, y - 1, 0])
        let condition2 = result.contains([x + 1, y - 1, 0])
        let condition3 = result.contains([x - 1, y, 1]) && result.contains([x + 1, y, 1])
        
        if !condition1 && !condition2 && !condition3 {
            return false
        }
    }
    
    return true
}

func delete(_ result: [[Int]]) -> Bool {
    for frame in result {
        let (x, y, a) = (frame[0], frame[1], frame[2])
        
        if !install(x, y, a, result) {
            return false
        }
    }
    
    return true
}

func solution(_ n:Int, _ build_frame:[[Int]]) -> [[Int]] {
    var result = [[Int]]()
    
    for frame in build_frame {
        let (x, y, a, b) = (frame[0], frame[1], frame[2], frame[3])
        
        if b == 0 {
            result.remove(at: result.firstIndex(of: [x, y, a])!)
            if !delete(result) {
                result.append([x, y, a])
            }
        } else {
            if install(x, y, a, result) {
                result.append([x, y, a])
            }
        }
    }
    
    result.sort {
        if $0[0] == $1[0] {
            if $0[1] == $1[1] {
                return $0[2] < $1[2]
            }
            return $0[1] < $1[1]
        }
        return $0[0] < $1[0]
    }
    
    return result
}