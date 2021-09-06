// https://programmers.co.kr/learn/courses/30/lessons/60060

import Foundation

func findStartIndex(_ str: String, _ words: [String]) -> Int {
    var result = words.count
    
    var start = 0
    var end = words.count - 1
    
    while start <= end {
        let mid = (start + end) / 2
        
        if words[mid] >= str {
            result = mid
            end = mid - 1
        }  else {
            start = mid + 1
        }
    }
    
    return result
}

func findEndIndex(_ str: String, _ words: [String]) -> Int {
    var result = -1
    
    var start = 0
    var end = words.count - 1
    
    while start <= end {
        let mid = (start + end) / 2
        
        if words[mid] <= str {
            result = mid
            start = mid + 1
        }  else {
            end = mid - 1
        }
    }
    
    return result
}

func solution(_ words:[String], _ queries:[String]) -> [Int] {
    var result = [Int]()
    
    var forth = Array(repeating: [String](), count: 10001)
    var back = Array(repeating: [String](), count: 10001)
    
    for word in words {
        forth[word.count].append(word)
        back[word.count].append(word.reversed().map { String($0) }.joined())
    }

    for i in 1...10000 {
        forth[i].sort()
        back[i].sort()
    }
    
    for i in queries {
        var query = Array(i).map { String($0) }
        var wordList = forth
        
        if query[0] == "?" {
            query = query.reversed()
            wordList = back
        }
        
        let s = query.map { $0 == "?" ? "a" : $0 }.joined()
        let e = query.map { $0 == "?" ? "z" : $0 }.joined()
        
        let startIdx = findStartIndex(s, wordList[query.count])
        let endIdx = findEndIndex(e, wordList[query.count])
        
        if startIdx > endIdx  {
            result.append(0)
        } else {
            result.append(endIdx - startIdx + 1)
        }
    }
    
    return result
}