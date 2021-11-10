// https://programmers.co.kr/learn/courses/30/lessons/12903

func solution(_ s: String) -> String {
    let s = Array(s).map { String($0) }
    let mid = s.count / 2
    
    return s.count % 2 == 0 ? s[mid - 1] + s[mid] : s[mid]
}