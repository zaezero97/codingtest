//
//  main.swift
//  1967.트리의 지름
//
//  Created by 재영신 on 2022/04/26.
//

import Foundation

func main() {
    let n = Int(readLine()!)!
    
    var edges = [[(to: Int, weight: Int)]](repeating: [(to: Int, weight: Int)](), count: n+1)
    var endNode = 0
    var max = 0
    var visited = [Bool](repeating: false, count: n + 1)
    for _ in 1 ..< n {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        edges[input[0]].append((input[1],input[2]))
        edges[input[1]].append((input[0],input[2]))
    }
        
    //임의의 노드에서 가장 멀리있는 노드를 찾는다
    dfs(1, 0)
    
    //임의의 노드에서 가장 멀리있는 노드를 기준으로 기장 멀리있는 노드를 찾ㄴ큰다.
    visited = [Bool](repeating: false, count: n + 1)
    dfs(endNode, 0)
    print(max)
    func dfs(_ node: Int, _ distance: Int) {
        
        if visited[node] {
            return
        }
        
        if distance > max {
            max = distance
            endNode = node
        }
        visited[node] = true
        
        for i in 0 ..< edges[node].count {
            dfs(edges[node][i].to, distance + edges[node][i].weight)
        }
    }
}



main()
