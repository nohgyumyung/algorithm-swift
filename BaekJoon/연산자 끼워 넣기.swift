// https://www.acmicpc.net/problem/14888

let n = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int($0)! }
let count = readLine()!.split(separator: " ").map { Int($0)! }
var (add, sub, mul, div) = (count[0], count[1], count[2], count[3])

var minValue = Int(1e9)
var maxValue = -Int(1e9)

func dfs(_ i: Int, _ now: Int) {
    if i == n {
        minValue = min(minValue, now)
        maxValue = max(maxValue, now)
    } else {
        if add > 0 {
            add -= 1
            dfs(i + 1, now + numbers[i])
            add += 1
        }
        if sub > 0 {
            sub -= 1
            dfs(i + 1, now - numbers[i])
            sub += 1
        }
        if mul > 0 {
            mul -= 1
            dfs(i + 1, now * numbers[i])
            mul += 1
        }
        if div > 0 {
            div -= 1
            dfs(i + 1, now / numbers[i])
            div += 1
        }
    }
}

dfs(1, numbers[0])

print(maxValue)
print(minValue)