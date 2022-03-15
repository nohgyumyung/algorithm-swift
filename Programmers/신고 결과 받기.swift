// https://programmers.co.kr/learn/courses/30/lessons/92334

import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var reportStats = [String: [String]]()
    var receiveEmailCnt = [String: Int]()

    for id in id_list {
        reportStats[id] = []
        receiveEmailCnt[id] = 0
    }

    for eachReport in Set(report) {
        let info = eachReport.split(separator: " ").map { String($0) }
        let (from, to) = (info[0], info[1])
        reportStats[to]! += [from]
    }

    for id in id_list {
        let reporterList = reportStats[id]!
        if reporterList.count >= k {
            for reporter in reporterList {
                receiveEmailCnt[reporter]! += 1
            }
        }
    }

    return id_list.map { receiveEmailCnt[$0]! }
}