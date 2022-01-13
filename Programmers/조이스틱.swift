// https://programmers.co.kr/learn/courses/30/lessons/42860

import Foundation

func solution(_ name: String) -> Int {
    let lowBound = Character("A").asciiValue!
    let highBound = Character("Z").asciiValue! + 1
    
    let name = name.map { $0 }
    var minMove = name.count - 1
    var result = 0

    for char in name {
        result += Int(min(char.asciiValue! - lowBound, highBound - char.asciiValue!))
    }
    
    for i in name.indices {
        if name[i] != "A" {
            var next = i + 1
            while next < name.count && name[next] == "A" {
                next += 1
            }
            let move = 2 * i + name.count - next
            minMove = min(minMove, move)
        }
    }
    
    return result + minMove
}