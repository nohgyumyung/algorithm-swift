// https://programmers.co.kr/learn/courses/30/lessons/42895

import Foundation

func solution(_ N: Int, _ number: Int) -> Int {
    var table = Array(repeating: [Int](), count: 9)
    table[1] = [N]
    
    if N == number {
        return 1
    }

    for i in 1..<8 {
        table[i + 1].append(Int(Array(repeating: String(N), count: i + 1).joined())!)
        for splitIdx in 1...(i + 1) / 2 {
            for number1 in table[splitIdx] {
                for number2 in table[i + 1 - splitIdx] {
                    table[i + 1].append(number1 + number2)
                    table[i + 1].append(number1 - number2)
                    table[i + 1].append(number2 - number1)
                    table[i + 1].append(number1 * number2)
                    table[i + 1].append(number2 == 0 ? 0 : number1 / number2)
                    table[i + 1].append(number1 == 0 ? 0 : number2 / number1)
                }
            }
        }

        if table[i + 1].contains(number) {
            return i + 1
        }
    }

    return -1
}