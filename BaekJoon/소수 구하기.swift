// https://www.acmicpc.net/problem/1929

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (M, N) = (input[0], input[1])

let maxNum = 1000000
var prime = [false, false] + Array(repeating: true, count: maxNum)

for i in 2...maxNum {
    if !prime[i] {
        continue
    }
    
    if i * i > maxNum {
        continue
    }
    
    for j in stride(from: i * i, to: maxNum, by: i) {
        prime[j] = false
    }
}

for i in M...N {
    if prime[i] {
        print(i)
    }
}