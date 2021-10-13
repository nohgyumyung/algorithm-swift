// https://programmers.co.kr/learn/courses/30/lessons/42888

import Foundation

func solution(_ records: [String]) -> [String] {
    var nickNames = [String: String]()
    var result = [String]()
    
    for record in records {
        let info = record.components(separatedBy: " ")
        
        if info[0] != "Leave" {
            nickNames[info[1]] = info[2]
        }
    }
    
    for record in records {
        let info = record.components(separatedBy: " ")
        
        if info[0] == "Enter" {
            result.append("\(nickNames[info[1]]!)님이 들어왔습니다.")
        } else if info[0] == "Leave" {
            result.append("\(nickNames[info[1]]!)님이 나갔습니다.")
        }
    }
    
    return result
}