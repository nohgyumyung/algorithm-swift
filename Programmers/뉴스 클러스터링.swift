// https://programmers.co.kr/learn/courses/30/lessons/17677

func solution(_ str1:String, _ str2:String) -> Int {
    let str1 = str1.map { $0.lowercased() }
    let str2 = str2.map { $0.lowercased() }
    var arr1 = [String]()
    var arr2 = [String]()

    for i in 0..<str1.count - 1 {
        if Character(str1[i]).isLetter && Character(str1[i + 1]).isLetter {
            arr1.append(str1[i] + str1[i + 1])
        }
    }

    for i in 0..<str2.count - 1 {
        if Character(str2[i]).isLetter && Character(str2[i + 1]).isLetter {
            arr2.append(str2[i] + str2[i + 1])
        }
    }

    arr1.sort()
    arr2.sort()

    var unionCnt = arr1.count + arr2.count
    var intersectionCnt = 0

    while !arr1.isEmpty && !arr2.isEmpty {
        if arr1.last! == arr2.last! {
            arr1.removeLast()
            arr2.removeLast()
            intersectionCnt += 1
            unionCnt -= 1
        } else if arr1.last! > arr2.last! {
            arr1.removeLast()
        } else {
            arr2.removeLast()
        }
    }

    return unionCnt == 0 ? 65536 : Int(Double(intersectionCnt) / Double(unionCnt) * 65536)
}