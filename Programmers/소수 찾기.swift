// https://programmers.co.kr/learn/courses/30/lessons/42839

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
            if visited[i] {
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

func isPrime(_ num: Int) -> Bool {
    if num < 2 {
        return false
    }
    
    for i in 2..<num {
        if num % i == 0 {
            return false
        }
    }
    
    return true
}

func solution(_ numbers:String) -> Int {
    let numbers = Array(numbers).map { String($0) }
    var result = [Int]()
    
    for i in 1...numbers.count {
        for nums in permute(numbers, i) {
            let num = Int(nums.joined())!
            
            if isPrime(num) {
                result.append(num)
            }
        }
    }
    
    return Set(result).count
}