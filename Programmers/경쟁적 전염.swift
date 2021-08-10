// https://www.acmicpc.net/problem/18405

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, k) = (input[0], input[1])

var graph = Array(repeating: Array(repeating: 0, count: n), count: n)
var virus = [(type: Int, x: Int, y: Int, time: Int)]()

for i in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    for j in 0..<n {
        if input[j] != 0 {
            graph[i][j] = input[j]
            virus.append((input[j], i, j, 0))
        }
    }
}

let target = readLine()!.split(separator: " ").map { Int(String($0))! }
let (s, x, y) = (target[0], target[1], target[2])

func getVirusType() {
    let dx = [1, -1, 0, 0]
    let dy = [0, 0, -1, 1]

    var queue = virus.sorted { $0.type < $1.type }

    while !queue.isEmpty {
        if queue[0].time == s {
            break
        }

        let v = queue.removeFirst()

        for i in 0..<4 {
            let nx = v.x + dx[i]
            let ny = v.y + dy[i]

            if nx < 0 || nx >= n || ny < 0 || ny >= n {
                continue
            }

            if graph[nx][ny] == 0 {
                graph[nx][ny] = v.type
                queue.append((v.type, nx, ny, v.time + 1))
            }
        }
    }

    print(graph[x - 1][y - 1])
}

getVirusType()