// https://programmers.co.kr/learn/courses/30/lessons/42578

import Foundation

func solution(_ clothes:[[String]]) -> Int {
    let types = Set(clothes.compactMap({ $0.last }))
    var counts = [Int]()
    
    for type in types {
        let count = clothes.filter({ $0.last == type }).count + 1
        counts.append(count)
    }

    return  counts.reduce(1, { $0 * $1 }) - 1
}