// https://programmers.co.kr/learn/courses/30/lessons/60062

import Foundation

func permute<T>(_ elements: Array<T>, _ k: Int) -> [[T]] {
    var result = [[T]]()
    var visited = Array(repeating: false, count: elements.count)
    
    func permutation(_ nowPermute: [T]) {
        if nowPermute.count == k {
            result.append(nowPermute)
            return
        }
        
        for i in 0..<elements.count {
            if visited[i] == true {
                continue
            } else {
                visited[i] = true
                permutation(nowPermute + [elements[i]])
                visited[i] = false
            }
        }
    }
    
    permutation([])
    
    return result
}

func solution(_ n:Int, _ weak:[Int], _ dist:[Int]) -> Int {
    let weakLen = weak.count
    let weak = weak + weak.map { $0 + n }
    
    let orders = permute(dist, dist.count)
    var result = dist.count + 1
    
    for order in orders {
        for i in 0..<weakLen {
            var count = 1
            var pos = weak[i] + order[count - 1]
            
            for j in i..<i + weakLen {
                if pos < weak[j] {
                    count += 1
                    if count > dist.count {
                        break
                    }
                    pos = weak[j] + order[count - 1]
                }
            }
            
            result = min(result, count)
        }
    }

    if result > dist.count {
        return -1
    } else {
        return result
    }
}