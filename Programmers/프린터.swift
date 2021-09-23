// https://programmers.co.kr/learn/courses/30/lessons/42587

import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var queue = priorities.enumerated().map({ ($0.offset, $0.element)})
    var order = 0
    
    while true {
        let highestNum = queue.map({ $0.1 }).max()!
        let highestIdx = queue.firstIndex(where: { $0.1 == highestNum })!
        
        queue = Array(queue[highestIdx...]) + Array(queue[..<highestIdx])
        order += 1
        
        if queue.removeFirst().0 == location {
            return order
        }
    }
    
    return 0
}