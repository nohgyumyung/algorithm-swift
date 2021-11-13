// https://programmers.co.kr/learn/courses/30/lessons/67256

import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    var right = (3, 2)
    var left = (3, 0)
    var result = ""
    
    for number in numbers {
        if [1, 4, 7].contains(number) {
            result += "L"
            left = ((number - 1) / 3, 0)
        } else if [3, 6, 9].contains(number) {
            result += "R"
            right = ((number - 1) / 3 , 2)
        } else {
            let (x, y) = number == 0 ? (3, 1) : ((number - 1) / 3, 1)
            let dR = abs(x - right.0) + abs(y - right.1)
            let dL = abs(x - left.0) + abs(y - left.1)
            
            if dL < dR || (dR == dL && hand == "left") {
                result += "L"
                left = (x, y)
            } else {
                result += "R"
                right = (x, y)
            }
        }
    }
    
    return result
}