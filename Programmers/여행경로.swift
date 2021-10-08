// https://programmers.co.kr/learn/courses/30/lessons/43164

import Foundation

func solution(_ tickets:[[String]]) -> [String] {
    let tickets = tickets.sorted { $0[1] > $1[1] }
    var visited = Array(repeating: false, count: tickets.count)
    var result = [String]()
    
    func findRoute(_ route: [String], _ cur: String) {
        if visited.filter({ $0 == false }).count == 0 {
            result = route
            return
        }
        
        for i in tickets.indices {
            if tickets[i].first! == cur && !visited[i] {
                visited[i] = true
                findRoute(route + [tickets[i].last!], tickets[i].last!)
                visited[i] = false
            }
        }
    }
    
    findRoute(["ICN"], "ICN")
    
    return result
}