//
//  main.swift
//  1389.케빈 베이컨의 6단계 법칙
//
//  Created by 재영신 on 2022/01/12.
//

import Foundation

let NMInput = readLine()!.split(separator: " ").map{ Int(String($0))! }

let N = NMInput[0]
let M = NMInput[1]

solve()

func solve() {
    let inf = 99999
    var dis = [[Int]](repeating: [Int](repeating: inf, count: N+1), count: N+1)
    
    for _ in 0 ..< M {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        dis[input[0]][input[1]] = 1
        dis[input[1]][input[0]] = 1
    }
    for i in 1 ..< N {
        dis[i][i] = 0
    }
    
    for k in 1 ... N {
        for i in 1 ... N {
            for j in 1 ... N {
                  dis[i][j] = min(dis[i][j], dis[i][k] + dis[k][j])
            }
        }
    }
    
    var result = inf
    var resultIndex = 0
    for i in 1 ... N {
        var sum = 0
        for j in 1 ... N {
            if dis[i][j] != inf {
                sum += dis[i][j]
            }
        }
        if result > sum {
            resultIndex = i
            result = sum
        }
    }
    
    print(resultIndex)
}


