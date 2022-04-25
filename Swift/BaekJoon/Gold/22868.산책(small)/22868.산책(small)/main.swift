//
//  main.swift
//  22868.산책(small)
//
//  Created by 재영신 on 2022/04/24.
//

import Foundation

func main() {
    let firstInput = readLine()!.split(separator: " ").map { Int(String($0))! }
    let N = firstInput[0]
    let M = firstInput[1]
    
    var nodes = [[Int]](repeating: [Int](), count: N + 1)
    
    for _ in 0 ..< M {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        nodes[input[0]].append(input[1])
        nodes[input[1]].append(input[0])
    }
    
    let lastInput = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    let startNode = lastInput[0]
    let endNode = lastInput[1]
    
    for i in 0 ..< N {
        nodes[i].sort()
    }
    
    var visited = [Bool](repeating: false, count: N+1)
    var distance = 0
    
    func BFS(_ s: Int, _ e: Int, _ type: Int) -> [Int] {
        var queue = [(Int,[Int])]()
        queue.append((s,[]))
        visited[s] = true
        
        while !queue.isEmpty {
            let curNode = queue.removeFirst()
            
            // s->e
            if type == 0 {
                if curNode.0 == endNode {
                    return curNode.1
                }
            } else { // e->s
                if curNode.0 == startNode {
                    return curNode.1
                }
            }
            
            
            for node in nodes[curNode.0] {
                if !visited[node] {
                    visited[node] = true
                    queue.append((node,curNode.1 + [node]))
                }
            }
        }
        
        return []
    }
    
    var path = BFS(startNode, endNode, 0)
    distance = path.count
    
    visited = [Bool](repeating: false, count: N+1)
    path.forEach { node in
        visited[node] = true
    }
    
    
    path = BFS(endNode, startNode, 1)
    print(distance + path.count )
}

main()
