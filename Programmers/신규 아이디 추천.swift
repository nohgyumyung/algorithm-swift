// https://programmers.co.kr/learn/courses/30/lessons/72410

import Foundation

func solution(_ new_id:String) -> String {
    var id = new_id

    // 모든 대문자를 소문자로
    id = id.lowercased()
    
    // 소문자, 숫자, "-", "_", "."만 필터링
    let pattern1 = "[a-z0-9-_.]"
    let regex1 = try! NSRegularExpression(pattern: pattern1)
    let match = regex1.matches(in: id, options: [], range: _NSRange(location: 0, length: id.count))
    
    if !match.isEmpty {
        id = match.map { String(id[Range($0.range, in: id)!]) }.joined()
    }
    
    // 연속된 "."는 "."로 치환
    let pattern2 = "\\.+"
    let regex2 = try! NSRegularExpression(pattern: pattern2)
    id = regex2.stringByReplacingMatches(in: id, range: NSRange(location: 0, length: id.count), withTemplate: ".")

    // "."가 처음이나 끝에 위치한다면 제거
    while id.hasPrefix(".") {
        id.removeFirst()
    }
    
    while id.hasSuffix(".") {
        id.removeLast()
    }
    
    // 빈 문자열이라면 "a" 대입
    if id.isEmpty {
        id = "a"
    }

    // 길이를 15이하로 조정
    if id.count > 15 {
        let startIdx = id.startIndex
        let endIdx = id.index(startIdx, offsetBy: 15)
        id = String(id[startIdx..<endIdx])
    }

    // "."가 끝에 있다면 제거
    while id.hasSuffix(".") {
        id.removeLast()
    }

    // 길이가 2자 이하라면 마지막 문자를 길이가 3이 될때까지 붙히기
    if id.count <= 2 {
        id += Array(repeating: String(id.last!), count: 3 - id.count).joined()
    }

    return id
}