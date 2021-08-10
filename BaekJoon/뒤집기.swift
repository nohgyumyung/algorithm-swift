// https://www.acmicpc.net/problem/1439

let arr = Array(readLine()!).map { Int(String($0))! }

var count = 0

for i in 0..<arr.count - 1 {
    if arr[i] != arr[i + 1] {
        count += 1
    }
}

print((count + 1) / 2)
