// https://programmers.co.kr/learn/courses/30/lessons/43165

import Foundation

var count = 0
var add = 0
var sub = 0

func dfs(_ i: Int, _ now: Int, _ target: Int, _ numbers: [Int]) {
    if i == numbers.count {
        if now == target {
            count += 1
        }
    } else {
        dfs(i + 1, now + numbers[i], target, numbers)
        dfs(i + 1, now - numbers[i], target, numbers)
    }
}

func solution(_ numbers:[Int], _ target:Int) -> Int {
    dfs(0, 0, target, numbers)
    
    return count
}