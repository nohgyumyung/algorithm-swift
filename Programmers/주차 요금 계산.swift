// https://programmers.co.kr/learn/courses/30/lessons/92341

import Foundation

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    let (minTime, minFee, unitTime, unitFee) = (fees[0], fees[1], fees[2], fees[3])
    var info = [String: (state: String, inTime: String, totalTime: Int)]()
    
    func timeToMin(_ time: String) -> Int {
        let time = time.components(separatedBy: ":").map { Int($0)! }
        let (hour, min) = (time[0], time[1])
        return hour * 60 + min
    }

    func timeToFee(_ time: Int) -> Int {
        if time > minTime {
            return minFee + (time - minTime + unitTime - 1) / unitTime * unitFee
        } else {
            return minFee
        }
    }
    
    for record in records {
        let eachRecord = record.components(separatedBy: " ")
        let (time, carNum, state) = (eachRecord[0], eachRecord[1], eachRecord[2])
        
        if info[carNum] != nil {
            if info[carNum]!.state == "IN" {
                info[carNum]!.state = state
                info[carNum]!.totalTime += timeToMin(time) - timeToMin(info[carNum]!.inTime)
            } else {
                info[carNum]!.state = state
                info[carNum]!.inTime = time
            }
        } else {
            info[carNum] = (state, time, 0)
        }
    }
    
    for carNum in info.keys {
        if info[carNum]!.state == "IN" {
            info[carNum]!.totalTime += timeToMin("23:59") - timeToMin(info[carNum]!.inTime)
        }
    }
    
    return info.keys.sorted { $0 <= $1 } .map { timeToFee(info[$0]!.totalTime) }
}