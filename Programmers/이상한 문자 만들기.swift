// https://programmers.co.kr/learn/courses/30/lessons/12930

func solution(_ s: String) -> String {
    let str = Array(s)
    var result = ""
    var idx = 0

    for i in str.indices {
        if str[i] == " " {
            result += " "
            idx = 0
        } else {
            if idx % 2 == 0 {
                result += str[i].uppercased()
            } else {
                result += str[i].lowercased()
            }
            
            idx += 1
        }
    }

    return result
}