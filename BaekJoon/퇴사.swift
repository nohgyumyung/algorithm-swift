// https://www.acmicpc.net/problem/14501

let n = Int(String(readLine()!))!
var dp = Array(repeating: 0, count: n + 2)

var time = Array(repeating: 0, count: n + 1)
var cost = Array(repeating: 0, count: n + 1)

for i in 1...n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    time[i] = input[0]
    cost[i] = input[1]
}

var maxValue = 0

for i in stride(from: n, to: 0, by: -1) {
    if i + time[i] > n + 1 {
        dp[i] = maxValue
        continue
    }
    
    dp[i] = max(cost[i] + dp[i + time[i]], maxValue)
    maxValue = dp[i]
}

print(maxValue)