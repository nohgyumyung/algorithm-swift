// https://programmers.co.kr/learn/courses/30/lessons/42746

import Foundation

func solution(_ numbers:[Int]) -> String {
    let stringNum = numbers.map { String($0) }
    let result = stringNum.sorted(by: { $0 + $1 > $1 + $0 }).joined()
    
    return result.first == "0" ? "0" : result
}
