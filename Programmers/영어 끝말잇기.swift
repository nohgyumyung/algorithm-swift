// https://programmers.co.kr/learn/courses/30/lessons/12981

import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var wordSet = [words[0]]
    var word = words[0]
    
    for i in 1..<words.count {
        if wordSet.contains(words[i]) {
            return [i % n + 1, i / n + 1]
        }
        
        if word.last! != words[i].first! {
            return [i % n + 1, i / n + 1]
        }
        
        wordSet.append(words[i])
        word = words[i]
    }
    
    return [0, 0]
}