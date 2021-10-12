// https://programmers.co.kr/learn/courses/30/lessons/87377

import Foundation

func solution(_ line:[[Int]]) -> [String] {
    var points = [[Int]]()

    for i in line.indices {
        for j in line.indices {
            let (A, B, E, C, D, F) = (line[i][0], line[i][1], line[i][2], line[j][0], line[j][1], line[j][2])
            let denominator = A * D - B * C
            let xNumerator = B * F - E * D
            let yNumerator = E * C - A * F

            if denominator != 0 && xNumerator % denominator == 0 && yNumerator % denominator == 0 {
                points.append([xNumerator / denominator, yNumerator / denominator])
            }
        }
    }

    let (xMin, xMax) = (points.map({ $0[0] }).min()!, points.map({ $0[0] }).max()!)
    let (yMin, yMax) = (points.map({ $0[1] }).min()!, points.map({ $0[1] }).max()!)
    var result = Array(repeating: Array(repeating: ".", count: xMax - xMin + 1), count: yMax - yMin + 1)

    for point in points {
        result[(yMax - yMin) - (point[1] - yMin)][point[0] - xMin] = "*"
    }

    return result.map({ $0.joined() })
}