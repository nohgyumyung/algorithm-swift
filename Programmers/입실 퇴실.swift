// https://programmers.co.kr/learn/courses/30/lessons/86048

import Foundation

func solution(_ enter:[Int], _ leave:[Int]) -> [Int] {
    var meet = Array(repeating: [Int](), count: enter.count)
    var enter = enter
    var cur = -1
    
    for n in leave {
        let idx = enter.firstIndex(of: n)!
        
        if idx < cur {
            enter[idx] = -1
            continue
        }
        
        for i in (cur + 1)...idx {
            for j in 0..<i {
                if enter[i] != -1 && enter[j] != -1 {
                    meet[enter[i] - 1].append(enter[j])
                    meet[enter[j] - 1].append(enter[i])
                }
            }
        }
            
        cur = idx
        enter[idx] = -1
    }
    
    return meet.map { $0.count }
}