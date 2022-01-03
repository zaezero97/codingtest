//
//  main.swift
//  RGB거리
//
//  Created by 재영신 on 2022/01/03.
//

// dp
import Foundation

let N = Int(readLine()!)!
var cost = [[Int]](repeating: [Int](repeating: 0, count: 3), count: N)

for i in 0 ..< N {
    cost[i] = readLine()!.components(separatedBy: " ").compactMap{Int($0)}
}

for i in 1 ..< N {
    cost[i][0] += min(cost[i-1][1],cost[i-1][2])
    cost[i][1] += min(cost[i-1][0],cost[i-1][2])
    cost[i][2] += min(cost[i-1][0],cost[i-1][1])
}

print(min(min(cost[N-1][0],cost[N-1][1]),cost[N-1][2]))
