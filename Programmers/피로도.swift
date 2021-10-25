// https://programmers.co.kr/learn/courses/30/lessons/87946

import Foundation

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    let visited = Array(repeating: false, count: dungeons.count)
    var result = 0
    
    func dfs(_ visited: [Bool], _ health: Int, _ count: Int) {
        result = max(result, count)
            
        for i in dungeons.indices {
            if !visited[i] && health >= dungeons[i][0] {
                var newVisited = visited
                newVisited[i] = true
                
                dfs(newVisited, health - dungeons[i][1], count + 1)
            }
        }
    }
    
    dfs(visited, k, 0)
    
    return result
}