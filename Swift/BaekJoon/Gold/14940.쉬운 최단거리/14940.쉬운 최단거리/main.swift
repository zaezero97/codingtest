//
//  main.swift
//  14940.쉬운 최단거리
//
//  Created by 재영신 on 2022/04/29.
//

import Foundation

func main() {
    let firstInput = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    let n = firstInput[0]
    let m = firstInput[1]
    
    var map = [[Int]]()
    var goalPoint: (x: Int, y: Int)!
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    var result = [[Int]](repeating: [Int](repeating: -1, count: m), count: n)
    
    let dx = [1,0,-1,0]
    let dy = [0,1,0,-1]
    
    for i in 0 ..< n {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        map.append(input)
        for j in 0 ..< m {
            if input[j] == 2 {
                goalPoint = (j,i)
                result[i][j] = 0
            } else if input[j] == 0 {
                result[i][j] = 0
            }
        }
    }
    
    var queue = [(x: Int, y: Int)]()
    queue.append(goalPoint)
    visited[goalPoint.y][goalPoint.x] = true
    var index = 0
    
    while queue.count > index {
        let point = queue[index]
        for i in 0 ..< 4 {
            let nx = point.x + dx[i]
            let ny = point.y + dy[i]
            
            if nx < 0 || nx >= m || ny < 0 || ny >= n || visited[ny][nx] || map[ny][nx] == 0 {
                continue
            }
            
            visited[ny][nx] = true
            result[ny][nx] = result[point.y][point.x] + 1
            queue.append((nx, ny))
        }
        
        index += 1
    }
       
    result.forEach { line in
        print(line.map { String($0) }.joined(separator: " "))
        
    }
}

main()
