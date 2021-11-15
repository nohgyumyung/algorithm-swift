// https://programmers.co.kr/learn/courses/30/lessons/76501

import Foundation

func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    var result = 0
    
    for i in absolutes.indices {
        if signs[i] == true {
            result += absolutes[i]
        } else {
            result -= absolutes[i]
        }
    }
    
    return result
}