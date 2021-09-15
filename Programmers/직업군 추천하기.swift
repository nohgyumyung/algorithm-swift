// https://programmers.co.kr/learn/courses/30/lessons/84325

import Foundation

func solution(_ table:[String], _ languages:[String], _ preference:[Int]) -> String {
    var maxScore = -1
    var result = "Z"
    
    for each in table {
        let info = each.split(separator: " ").map { String($0) }
        var score = 0
        
        for i in languages.indices {
            if info.contains(languages[i]) {
                score += preference[i] * (6 - info.firstIndex(of: languages[i])!)
            }
        }
        
        if score > maxScore {
            maxScore = score
            result = info[0]
        }
        
        if score == maxScore {
            result = min(result, info[0])
        }
    }
    
    return result
}