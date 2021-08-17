// https://www.acmicpc.net/problem/2887

// 원소의 부모 노드 찾기
func findParent(_ n: Int) -> Int {
    if parent[n] != n {
        parent[n] = findParent(parent[n])
    }
    
    return parent[n]
}

// 두 원소의 집합 합치기
func unionParent(_ a: Int, _ b: Int) {
    let a = findParent(a)
    let b = findParent(b)
    
    if a < b {
        parent[b] = a
    } else {
        parent[a] = b
    }
}

// 노드의 수, 간선, 부모 노드와 최소 거리를 담을 변수
let n = Int(readLine()!)!
var edges = [(a: Int, b: Int, d: Int)]()
var parent = Array(repeating: 0, count: n)
var result = 0

// 부모 노드를 자기 자신으로 초기화
for i in 0..<n {
    parent[i] = i
}

// 모든 노드에 대해 x, y, z 각각 좌표 입력 받은 후 정렬
var x = [(pos: Int, idx: Int)]()
var y = [(pos: Int, idx: Int)]()
var z = [(pos: Int, idx: Int)]()

for i in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    x.append((input[0], i))
    y.append((input[1], i))
    z.append((input[2], i))
}

x.sort { $0.pos < $1.pos }
y.sort { $0.pos < $1.pos }
z.sort { $0.pos < $1.pos }

// x, y, z 각각으로부터 간선 정보를 구한 후 정렬
for i in 0..<n - 1 {
    edges.append((x[i].idx, x[i + 1].idx, x[i + 1].pos - x[i].pos))
    edges.append((y[i].idx, y[i + 1].idx, y[i + 1].pos - y[i].pos))
    edges.append((z[i].idx, z[i + 1].idx, z[i + 1].pos - z[i].pos))
}

edges.sort { $0.d < $1.d }

// 크루스칼 알고리즘을 통해 최소 거리 구하기
for edge in edges {
    let parentA = findParent(edge.a)
    let parentB = findParent(edge.b)
    
    if parentA != parentB {
        unionParent(edge.a, edge.b)
        result += edge.d
    }
}

print(result)