// https://www.acmicpc.net/problem/15686

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

func getMinDistance(house: [(Int, Int)], chicken: [(Int, Int)], m: Int) -> Int {
    var result = Int(1e9)
    let combos = combi(chicken, m)
    
    for combo in combos {
        var minDistance = 0
        for h in house {
            var d = Int(1e9)
            for c in combo {
                d = min(d, abs(h.0 - c.0) + abs(h.1 - c.1))
            }
            minDistance += d
        }
        result = min(result, minDistance)
    }
    
    return result
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])

var house = [(Int, Int)]()
var chicken = [(Int, Int)]()

for i in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }

    for j in 0..<n {
        if input[j] == 1 {
            house.append((i, j))
        } else if input[j] == 2 {
            chicken.append((i, j))
        }
    }
}

let result = getMinDistance(house: house, chicken: chicken, m: m)
print(result)
