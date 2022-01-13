//
//  main.swift
//  2606.바이러스
//
//  Created by 재영신 on 2022/01/13.
//

import Foundation

solve()

func solve() {
    let computerN = Int(readLine()!)!
    let connectN = Int(readLine()!)!
    
    var connect = [[Int]](repeating: [Int](), count: computerN + 1)
    
    for _ in 0 ..< connectN {
        let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
        connect[input[0]].append(input[1])
        connect[input[1]].append(input[0])
    }
    var result = 0
    var queue = [Int]()
    var visited = [Bool](repeating: false, count: computerN + 1)
    
    visited[1] = true
    queue.append(1)
    
    while !queue.isEmpty {
        let computer = queue.removeFirst()
        for near in connect[computer] {
            if !visited[near] {
                visited[near] = true
                queue.append(near)
                result += 1
            }
        }
    }
    print(result)
}
