// https://programmers.co.kr/learn/courses/30/lessons/85002

import Foundation

func solution(_ weights:[Int], _ head2head:[String]) -> [Int] {
    var info = [(Double, Int, Int, Int)]()
    
    for boxer in head2head.indices {
        let matches = Array(head2head[boxer]).map { String($0) }
        var total = 0
        var win = 0
        var heavier = 0
        
        for i in matches.indices {
            if matches[i] != "N" {
                total += 1
                
                if matches[i] == "W" {
                    win += 1
                    
                    if weights[i] > weights[boxer] {
                        heavier += 1
                    }
                }
            }
        }
        
        info.append((total == 0 ? 0 : (Double(win) / Double(total)), heavier, weights[boxer], boxer + 1))
    }
    
    info.sort {
        if $0.0 == $1.0 {
            if $0.1 == $1.1 {
                if $0.2 == $1.2 {
                    return $0.3 < $1.3
                }
                return $0.2 > $1.2
            }
            return $0.1 > $1.1
        }
        return $0.0 > $1.0
    }
    
    return info.map { $0.3 }
}