// https://programmers.co.kr/learn/courses/30/lessons/81301

import Foundation

func solution(_ s: String) -> Int {
    let dic = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
    var str = s
    
    for i in 0..<10 {
        str = str.replacingOccurrences(of: dic[i], with: String(i))
    }
    
    return Int(str)!
}