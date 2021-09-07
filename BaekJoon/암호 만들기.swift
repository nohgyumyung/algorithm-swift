// https://www.acmicpc.net/problem/1759

import Foundation

func combi<T>(_ elements: Array<T>, _ k: Int) -> [[T]] {
    var result = [[T]]()
    
    func combination(_ idx: Int, _ combos: [T]) {
        if combos.count == k {
            result.append(combos)
            return
        }
        
        for i in idx..<elements.count {
            combination(i + 1, combos + [elements[i]])
        }
    }
    
    combination(0, [])
    
    return result
}

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (L, C) = (input[0], input[1])

var arr = readLine()!.split(separator: " ").map { String($0) }
arr.sort()

for i in combi(arr, L) {
    let cnt = i.filter { $0 == "a" || $0 == "e" || $0 == "i" || $0 == "o" || $0 == "u"}.count
    
    if cnt > 0 && cnt <= L - 2 {
        print(i.joined())
    }
}
