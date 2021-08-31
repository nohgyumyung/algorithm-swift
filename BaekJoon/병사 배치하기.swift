// https://www.acmicpc.net/problem/18353

import Foundation

let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map { Int(String($0))! }
var dp = Array(repeating: 1, count: n)

for i in 1..<n {
    for j in 0..<i {
        if arr[j] > arr[i] {
            dp[i] = max(dp[i], dp[j] + 1)
        }
    }
}

print(n - dp.max()!)