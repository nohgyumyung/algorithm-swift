// https://www.acmicpc.net/problem/10825

import Foundation

let N = Int(String(readLine()!))!

var scores = [(name: String, kor: Int, eng: Int, math: Int)]()

for _ in 0..<N {
    let score = readLine()!.split(separator: " ").map { String($0) }
    scores.append((name: score[0], kor: Int(score[1])!, eng: Int(score[2])!, math: Int(score[3])!))
}

scores.sort {
    if $0.kor == $1.kor {
        if $0.eng == $1.eng {
            if $0.math == $1.math {
                return $0.name < $1.name
            }
            return $0.math > $1.math
        }
        return $0.eng < $1.eng
    }
    return $0.kor > $1.kor
}

for i in scores {
    print(i.name)
}