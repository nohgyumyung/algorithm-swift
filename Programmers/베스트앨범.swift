// https://programmers.co.kr/learn/courses/30/lessons/42579

import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var dic = [String: [[Int]]]()
    var result = [Int]()
    
    genres.enumerated().forEach { (idx, value) in
        if dic[value] == nil {
            dic[value] = [[idx, plays[idx]]]
        } else {
            dic[value]! += [[idx, plays[idx]]]
        }
    }
    
    result = dic.values
        .sorted {
            $0.reduce(0, { $0 + $1[1] }) > $1.reduce(0, { $0 + $1[1] })
        }
        .flatMap {
            $0.sorted { $0[1] > $1[1] }.map { $0[0] }.prefix(2)
        }
    
    return result
}