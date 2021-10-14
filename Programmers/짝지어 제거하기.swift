// https://programmers.co.kr/learn/courses/30/lessons/12973

import Foundation

func solution(_ s: String) -> Int {
    let s = Array(s).map { String($0) }
    var stack = [""]
    
    for char in s {
        if char == stack.last! {
            stack.removeLast()
        } else {
            stack.append(char)
        }
    }
    
    return stack.count == 1 ? 1 : 0
}