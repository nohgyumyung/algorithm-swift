// https://programmers.co.kr/learn/courses/30/lessons/83201

import Foundation

func solution(_ scores:[[Int]]) -> String {
    let num = scores.count
    var result = ""
    
    for i in 0..<num {
        let selfScore = scores[i][i]
        var score = [Int]()
        var avg = 0
        
        for j in 0..<num {
            if i != j {
                score.append(scores[j][i])
            }
        }
        
        score.sort(by: <)
        
        if selfScore < score.first! || selfScore > score.last! {
            avg = score.reduce(0, +) / (num - 1)
        } else {
            avg = (score.reduce(0, +) + selfScore) / num
        }
        
        switch avg {
        case 90...:
            result += "A"
        case 80..<90:
            result += "B"
        case 70..<80:
            result += "C"
        case 50..<70:
            result += "D"
        default:
            result += "F"
        }
    }
    
    return result
}