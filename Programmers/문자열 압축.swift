// https://programmers.co.kr/learn/courses/30/lessons/60057

import Foundation

func solution(_ s:String) -> Int {
    let s = Array(s).map { String($0) }
    var result = 1000

    for unit in 1...s.count {
        var condensed = ""
        var count = 1
        
        let range = (0..<s.count / unit).map { $0 * unit }
        
        for i in range {
            let cur = s[i..<i + unit].joined()
            
            var next = ""
            if i != range.last {
                next = s[i + unit..<i + 2 * unit].joined()
            }
            
            if cur == next {
                count += 1
            } else {
                condensed += (count == 1 ? "" : String(count)) + cur
                count = 1
            }
        }
        
        if s.count % unit != 0 {
            condensed += s[(s.count - s.count % unit)...].joined()
        }

        result = min(result, condensed.count)
    }

    return result
}