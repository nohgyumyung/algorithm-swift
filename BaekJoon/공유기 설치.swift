// https://www.acmicpc.net/problem/2110

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])

var arr = [Int]()
for _ in 1...n {
    arr.append(Int(readLine()!)!)
}

func countRouter(_ arr: [Int], _ d: Int) -> Int {
    var cur = arr[0]
    var count = 1
    
    for i in arr {
        if i - cur >= d {
            count += 1
            cur = i
        }
    }
    
    return count
}

func findDistance(_ arr: [Int], _ m: Int) -> Int {
    let arr = arr.sorted(by: <)
    var result = 0
    
    var start = 1
    var end = arr.last! - arr.first!
    
    while start <= end {
        let mid = (end + start) / 2
        
        let n = countRouter(arr, mid)

        if n < m {
            end = mid - 1
        } else {
            result = max(result, mid)
            start = mid + 1
        }
    }
    
    return result
}

let result = findDistance(arr, m)
print(result)