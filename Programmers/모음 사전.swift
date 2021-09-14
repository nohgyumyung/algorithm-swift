// https://programmers.co.kr/learn/courses/30/lessons/84512

import Foundation

func dfs(_ str: String, _ target: String, _ cnt: Int) -> Int {
    let vowel: [Character] = ["A", "E", "I", "O", "U"]
    var str = str
    
    if str == target {
        return cnt
    }
    
    if str.count != 5 {
        return dfs(str + "A", target, cnt + 1)
    }
    
    while str.hasSuffix("U") {
        str.removeLast()
    }
    
    let lastLetter = str.removeLast()
    let nextLetter = vowel[vowel.firstIndex(of: lastLetter)! + 1]
    
    return dfs(str + String(nextLetter), target, cnt + 1)
}

func solution(_ word:String) -> Int {
    return dfs("", word, 0)
}
