// https://programmers.co.kr/learn/courses/30/lessons/42842

import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    for i in 3...2000 {
        for j in 3...i {
            if 2 * i + 2 * j - 4 == brown && (i - 2) * (j - 2) == yellow {
                return [i, j]
            }
        }
    }

    return []
}