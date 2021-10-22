// https://programmers.co.kr/learn/courses/30/lessons/64065

import Foundation

func solution(_ s:String) -> [Int] {
    var arr = [String]()
    var result = [Int]()
    
    arr = s.components(separatedBy: ["{", "}"])
        .filter({ !$0.isEmpty && $0 != "," })
        .sorted { $0.count < $1.count }
    
    for i in arr.indices {
        for j in arr[i].components(separatedBy: ",").map({ Int($0)! }) {
            if !result.contains(j) {
                result.append(j)
            }
        }
    }
    
    return result
}
