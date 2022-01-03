//
//  main.swift
//  DFS와 BFS
//
//  Created by 재영신 on 2022/01/03.
//

import Foundation

let firstInput = readLine()!.components(separatedBy: " ").compactMap{ Int($0) }
let N = firstInput[0]
let M = firstInput[1]
let V = firstInput[2]

var nodes = [[Int]](repeating: [Int](), count: N + 1)

for _ in 0 ..< M {
    let input = readLine()!.components(separatedBy: " ").compactMap{ Int($0)}
    nodes[input[0]].append(input[1])
    nodes[input[1]].append(input[0])
}

for i in 0 ..< nodes.count {
    nodes[i].sort()
}

var visited = [Bool](repeating: false, count: N + 1)
dfs(v: V)
visited = [Bool](repeating: false, count: N + 1)
print()
bfs(v: V)

func dfs(v: Int) {
    
    visited[v] = true
    print(v, terminator: " ")
    for i in nodes[v] {
        if !visited[i] {
            dfs(v: i)
        }
    }
}

func bfs(v: Int) {
    var queue = [Int]()
    queue.append(v)
    visited[v] = true
    
    while !queue.isEmpty {
        let node = queue.removeFirst()
        print(node,terminator: " ")
        for i in nodes[node] {
            if !visited[i] {
                queue.append(i)
                visited[i] = true
            }
        }
    }
}
