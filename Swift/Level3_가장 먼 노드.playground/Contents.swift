import Foundation

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    var distance = [Int](repeating: Int.max, count: n+1)
    distance[0] = 0
    distance[1] = 0
    var queue = [Int]()
    queue.append(1)
    var visited = [Bool](repeating: false, count: n+1)
    var edges = [[Int]](repeating: [Int](), count: n+1)
    var result = [Int](repeating: 0, count: n+1)
    edge.forEach{
        edges[$0[0]].append($0[1])
        edges[$0[1]].append($0[0])
    }
    while !queue.isEmpty
    {
        let cur_node = queue.removeFirst()
        visited[cur_node] = true
        for near_node in edges[cur_node]
        {
            if !visited[near_node]{
                let new_distance = distance[cur_node] + 1
                if distance[near_node] > new_distance
                {
                    distance[near_node] = new_distance
                    result[distance[near_node]] += 1
                    queue.append(near_node)
                }
            }
        }
    }
    let max = distance.max()
    return result[max!]
}

solution(4, [[4, 3], [1, 3], [2, 3]])



