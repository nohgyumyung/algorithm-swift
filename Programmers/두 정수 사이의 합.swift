// https://programmers.co.kr/learn/courses/30/lessons/12912

func solution(_ a:Int, _ b:Int) -> Int64 {
    var sum = 0
    
    for i in min(a, b)...max(a,b) {
        sum += i
    }
    
    return Int64(sum)
}