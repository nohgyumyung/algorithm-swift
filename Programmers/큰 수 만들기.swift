// https://programmers.co.kr/learn/courses/30/lessons/42883

import Foundation

func solution(_ number: String, _ k: Int) -> String {
    let numbers = Array(number).map { String($0) }
    var stack = ["9"]
    var removed = 0
    
    for i in 0..<numbers.count {
        while numbers[i] > stack.last! && removed < k {
            stack.removeLast()
            removed += 1
        }
        
        stack.append(numbers[i])
    }
    
    while removed < k {
        stack.removeLast()
        removed += 1
    }
    
    return stack[1...].joined()
}