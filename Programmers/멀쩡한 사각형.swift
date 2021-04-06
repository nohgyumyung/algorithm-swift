// https://programmers.co.kr/learn/courses/30/lessons/62048]

import Foundation

func solution(_ w: Int, _ h: Int) -> Int64 {
    let num = min(w, h)
    
    var lcm: Int = 1
    var firstCommonFactor: Int = 1
    var secondCommonFactor: Int = 1
    
    for i in (1...num).reversed() {
        if w % i == 0 && h % i == 0 {
            lcm = i
            firstCommonFactor = w / i
            secondCommonFactor = h / i
            break
        }
    }
    
    let answer: Int = w * h - (firstCommonFactor + secondCommonFactor - 1) * lcm
    
    return Int64(answer)
}
