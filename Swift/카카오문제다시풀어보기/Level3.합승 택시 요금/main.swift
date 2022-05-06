//
//  main.swift
//  카카오문제다시풀어보기
//
//  Created by 재영신 on 2022/05/05.
//

import Foundation

// 최단 경로 반환
func dijkstra(_ fares: [Int: [(des: Int, d: Int)]], _ s: Int, _ n: Int) -> [Int]{

    var allDistance = [Int](repeating: Int.max, count: n + 1)
    
    allDistance[s] = 0
    
    var priorityQueue = [(d: Int, i: Int)]()
    priorityQueue.append((0, s))
    
    while !priorityQueue.isEmpty {
        priorityQueue.sort(by: { $0.d > $1.d})
        let node = priorityQueue.removeLast()
        
        if allDistance[node.i] < node.d {
            continue
        }
        
        for fare in fares[node.i]! {
            if allDistance[fare.des] > fare.d + node.d {
                allDistance[fare.des] = fare.d + node.d
                priorityQueue.append((fare.d + node.d, fare.des))
            }
        }
    }
    
    return allDistance
}

func solution(_ n:Int, _ s:Int, _ a:Int, _ b:Int, _ fares:[[Int]]) -> Int {
    
    var nodes = [Int: [(des: Int, d: Int)]]()
    for i in 0 ..< fares.count {
        nodes[fares[i][0]] = nodes[fares[i][0]] == nil ? [(fares[i][1], fares[i][2])] : nodes[fares[i][0]]! + [(fares[i][1], fares[i][2])]
        nodes[fares[i][1]] = nodes[fares[i][1]] == nil ? [(fares[i][0], fares[i][2])] : nodes[fares[i][1]]! + [(fares[i][0], fares[i][2])]
    }
    var distances = [[Int]]()
    distances.append(dijkstra(nodes, s, n))
    distances.append(dijkstra(nodes, a, n))
    distances.append(dijkstra(nodes, b, n))
    
    var answer = Int.max
    for i in 1 ... n {
        if distances[0][i] == Int.max || distances[1][i] == Int.max || distances[2][i] == Int.max {
            continue
        }
        answer = min(answer, distances[0][i] + distances[1][i] + distances[2][i])
    }
    return answer
}

print(solution(6, 4, 5, 6, [[2, 6, 6], [6, 3, 7], [4, 6, 7], [6, 5, 11], [2, 5, 12], [5, 3, 20], [2, 4, 8], [4, 3, 9]]))
