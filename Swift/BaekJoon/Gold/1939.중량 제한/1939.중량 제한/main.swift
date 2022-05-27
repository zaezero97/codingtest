//
//  main.swift
//  1939.중량 제한
//
//  Created by 재영신 on 2022/05/27.
//

import Foundation

func main() {
    let firstInput = readLine()!.split(separator: " ").map { Int(String($0))! }
    let n = firstInput[0]
    let m = firstInput[1]
    
    var bridges = [[(des:Int, weight: Int)]](repeating: [], count: n+1)
    
    for _ in 0 ..< m {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        bridges[input[0]].append((input[1], input[2]))
        bridges[input[1]].append((input[0], input[2]))
    }
    
    let lastInput = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    var left = 0
    var right = 1000000000
    var answer = 0
    while right >= left {
        let mid = (left + right) / 2
        
        if bfs(mid: mid) {
            answer = mid
            left = mid + 1
        } else {
            right = mid - 1
        }
        
    }
    
    func bfs(mid: Int) -> Bool {
        
        var queue = [Int]()
        var visited = [Bool](repeating: false, count: n + 1)
        var index = 0
        
        queue.append(lastInput[0])
        visited[lastInput[0]] = true
        
        while queue.count > index {
            let point = queue[index]
            
            if point == lastInput[1] {
                return true
            }
            
            for near in bridges[point] {
                if !visited[near.des], near.weight >= mid {
                    queue.append(near.des)
                    visited[near.des] = true
                }
            }
            index += 1
        }
        
        return false
    }
    
    print(answer)
}

main()

