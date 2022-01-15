// https://leetcode.com/problems/number-of-islands/

class Solution {
    func bfs(_ i: Int, _ j: Int, _ visited: inout [[Bool]], _ grid: [[Character]]) {
        let dx = [0, 0, 1, -1]
        let dy = [1, -1, 0, 0]
        
        var queue = [[i, j]]
        
        while !queue.isEmpty {
            let node = queue.removeFirst()
            
            for i in 0..<4 {
                let x = node[0] + dx[i]
                let y = node[1] + dy[i]
                
                if x < 0 || y < 0 || x >= visited.count || y >= visited[0].count {
                    continue
                }
                
                if !visited[x][y] && grid[x][y] == "1" {
                    queue.append([x, y])
                    visited[x][y] = true
                }
            }
        }
    }
    
    func numIslands(_ grid: [[Character]]) -> Int {
        var visited = Array(repeating: Array(repeating: false, count: grid[0].count), count: grid.count)
        var numOfIslands = 0
        
        for i in grid.indices {
            for j in grid[0].indices {
                if !visited[i][j] && grid[i][j] == "1" {
                    numOfIslands += 1
                    bfs(i, j, &visited, grid)
                }
            }
        }
        
        return numOfIslands
    }
}