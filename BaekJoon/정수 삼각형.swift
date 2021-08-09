// https://www.acmicpc.net/problem/1932

let n = Int(String(readLine()!))!

var arr = [[Int]]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    arr.append(input)
}

for row in 1..<n {
    for col in 0...row {
        var a = 0
        var b = 0
        
        if col < row {
            a = arr[row - 1][col]
        }
        if col - 1 >= 0 {
            b = arr[row - 1][col - 1]
        }
        
        arr[row][col] += max(a, b)
    }
}

print(arr.last!.max()!)