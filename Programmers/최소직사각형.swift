// https://programmers.co.kr/learn/courses/30/lessons/86491

import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    var w = 0
    var h = 0
    
    for size in sizes {
        w = max(w, size.max()!)
        h = max(h, size.min()!)
    }
    
    return w * h
}