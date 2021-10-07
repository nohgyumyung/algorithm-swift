// https://programmers.co.kr/learn/courses/30/lessons/43163

import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    var words = words
    var queue = [(begin, 0)]
    
    while !queue.isEmpty {
        let (now, d) = queue.removeFirst()
        
        if now == target {
            return d
        }
        
        for i in 0..<now.count {
            let frontIdx = now.index(now.startIndex, offsetBy: i)
            let backIdx = now.index(now.startIndex, offsetBy: i + 1)
            
            for word in words {
                if word[..<frontIdx] + word[backIdx...] == now[..<frontIdx] + now[backIdx...] {
                    queue.append((word, d + 1))
                    words.remove(at: words.firstIndex(of: word)!)
                }
            }
        }
    }
    
    return 0
}