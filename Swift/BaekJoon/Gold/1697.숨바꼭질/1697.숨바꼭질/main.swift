//
//  main.swift
//  1697.숨바꼭질
//
//  Created by 재영신 on 2022/05/07.
//

import Foundation

func main() {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    let n = input[0]
    let k = input[1]
    
    var minT = Int.max
    
    var queue = [(x: Int, time: Int)]()
    var visited = [Bool](repeating: false, count: 2000001)
    
    queue.append((n, 0))
    visited[n] = true
    var index = 0
    
    while queue.count > index {
        let curPos = queue[index]
        if curPos.x == k {
            minT = min(minT, curPos.time)
            break
        }
        
        if curPos.x > 0, !visited[curPos.x - 1] {
            visited[curPos.x - 1] = true
            queue.append((curPos.x - 1, curPos.time + 1))
        }
        
        if curPos.x < k, !visited[curPos.x + 1] {
            visited[curPos.x + 1] = true
            queue.append((curPos.x + 1, curPos.time + 1))
        }
        if curPos.x < k, !visited[curPos.x * 2] {
            visited[curPos.x * 2] = true
            queue.append((curPos.x * 2, curPos.time + 1))
        }
        
        index += 1
    }

    print(minT)
}

main()
