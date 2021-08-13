// https://programmers.co.kr/learn/courses/30/lessons/60059

import Foundation

func rotate90(_ key: [[Int]]) -> [[Int]] {
    let keyLen = key.count
    var key90 = Array(repeating: Array(repeating: 0, count: keyLen), count: keyLen)
    
    for i in 0..<keyLen {
        for j in 0..<keyLen {
            key90[j][keyLen - 1 - i] = key[i][j]
        }
    }
    
    return key90
}

func check(_ lock: [[Int]]) -> Bool {
    let lockLen = lock.count / 3
    var result = true
    
    for i in 0..<lockLen {
        for j in 0..<lockLen {
            if lock[lockLen + i][lockLen + j] != 1 {
                result = false
            }
        }
    }
    
    return result
}

func solution(_ key:[[Int]], _ lock:[[Int]]) -> Bool {
    var key = key
    let keyLen = key.count
    let lockLen = lock.count
    let nLockLen = lockLen * 3
    var nLock = Array(repeating: Array(repeating: 0, count: nLockLen), count: nLockLen)
    
    for i in 0..<lockLen {
        for j in 0..<lockLen {
            nLock[lockLen + i][lockLen + j] = lock[i][j]
        }
    }
    
    for x in 0..<lockLen * 2 {
        for y in 0..<lockLen * 2 {
            for _ in 1...4 {
                key = rotate90(key)
                
                for dx in 0..<keyLen {
                    for dy in 0..<keyLen {
                        nLock[x + dx][y + dy] += key[dx][dy]
                    }
                }
                
                if check(nLock) {
                    return true
                }
                
                for dx in 0..<keyLen {
                    for dy in 0..<keyLen {
                        nLock[x + dx][y + dy] -= key[dx][dy]
                    }
                }
            }
        }
    }
    
    return false
}