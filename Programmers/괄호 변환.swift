// https://programmers.co.kr/learn/courses/30/lessons/60058

import Foundation

// 문자열이 올바른 괄호 문자열인지 확인
func check(_ p: String) -> Bool {
    for i in 0..<p.count {
        let p = Array(p)[...i]
        let a = p.filter { $0 == "(" }.count
        let b = p.filter { $0 == ")" }.count

        if b > a {
            return false
        }
    }

    return true
}

// 문자열의 괄호 방향 뒤집기
func reverse(_ p: String) -> String {
    var reversed = ""

    for i in Array(p) {
        if i == "(" {
            reversed += ")"
        } else {
            reversed += "("
        }
    }

    return reversed
}

func solution(_ p:String) -> String {
    // 입력이 빈 문자열이라면, 빈 문자열 반환
    if p == "" {
        return ""
    }

    // 문자열을 두 균형잡힌 u, v로 분리
    let p = Array(p).map { String($0) }
    var u = ""
    var v = ""

    for i in 0..<p.count {
        let lhs = p[...i].filter { $0 == "(" }.count
        let rhs = p[...i].filter { $0 == ")" }.count

        if lhs == rhs {
            u = p[...i].joined()
            v = p[(i + 1)...].joined()
            break
        }
    }

    // 올바른 괄호 문자열로 변환
    if check(u) {
        // 1. u가 올바른 괄호 문자열일때
        return u + solution(v)
    } else {
        // 2. u 가 올바른 괄호 문자열이 아닐때
        u = Array(u).map { String($0) }[1..<u.count - 1].joined()
        u = reverse(u)
        return "(" + solution(v) + ")" + u
    }
}