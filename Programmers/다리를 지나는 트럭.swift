// https://programmers.co.kr/learn/courses/30/lessons/42583

import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var waiting = truck_weights
    var onBridge = [Int]()
    var dist = [Int]()
    var sec = 0
    
    while !onBridge.isEmpty || !waiting.isEmpty {
        sec += 1
        
        while !onBridge.isEmpty {
            if dist.first! != bridge_length {
                break
            }
            
            onBridge.removeFirst()
            dist.removeFirst()
        }
        
        for i in dist.indices {
            dist[i] += 1
        }
        
        if let nextTruck = waiting.first {
            if onBridge.reduce(0, +) + nextTruck <= weight {
                waiting.removeFirst()
                onBridge.append(nextTruck)
                dist.append(1)
            }
        }
    }
    
    return sec
}