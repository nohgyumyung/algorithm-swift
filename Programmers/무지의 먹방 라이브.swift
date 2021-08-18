// https://programmers.co.kr/learn/courses/30/lessons/42891

import Foundation

func solution(_ food_times:[Int], _ k:Int64) -> Int {
    var k = Int(k)
    var foodTimes = [(t: Int, i: Int)]()
    var foodNum = food_times.count
    var time = 0
    var cur = 0
    
    for i in 0..<food_times.count {
        foodTimes.append((food_times[i], i + 1))
    }
    
    foodTimes.sort { $0.t < $1.t }
    
    while k >= (foodTimes[cur].t - time) * foodNum {
        k -= (foodTimes[cur].t - time) * foodNum
        time += (foodTimes[cur].t - time)
        foodNum -= 1
        cur += 1
        
        if foodNum == 0 {
            return -1
        }
    }
    
    foodTimes = foodTimes[cur...].sorted { $0.i < $1.i }
    
    return foodTimes[k % foodTimes.count].i
}