// https://leetcode.com/problems/island-perimeter/

class Solution {
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        
        var perimeter = 0
        
        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                if grid[i][j] == 1 {
                    
                    perimeter += 4
                    
                    // check left
                    if i != 0 && grid[i-1][j] == 1 {
                        perimeter -= 1
                    }
                    
                    // check right
                    if i != grid.count-1 && grid[i+1][j] == 1 {
                        perimeter -= 1
                    }
                    
                    // check top
                    if j != 0 && grid[i][j-1] == 1 {
                        perimeter -= 1
                    }
                    
                    // check bottom
                    if j != grid[i].count-1 && grid[i][j+1] == 1 {
                        perimeter -= 1
                    }
                    
                }
            }
        }
        
        return perimeter
    }
}