// https://www.acmicpc.net/problem/18406

import Foundation

let input = Array(readLine()!).map { Int(String($0))! }

let mid = input.count / 2

let left = input[..<mid].reduce(0, +)
let right = input[mid...].reduce(0, +)

if left == right {
    print("LUCKY")
} else {
    print("READY")
}