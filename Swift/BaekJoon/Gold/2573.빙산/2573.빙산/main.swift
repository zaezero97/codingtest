//
//  main.swift
//  2573.빙산
//
//  Created by 재영신 on 2022/04/27.
//

import Foundation

func main() {
    let firstInput = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    let N = firstInput[0]
    let M = firstInput[1]
    let dx = [1, 0, -1, 0]
    let dy = [0, 1, 0, -1]
    
    var map = [[Int]]()
    var ices = [(x: Int, y: Int)]()
    
    for i in 0 ..< N {
        map.append(readLine()!.split(separator: " ").map { Int(String($0))! })
        for j in 0 ..< M {
            if map[i][j] != 0 {
                ices.append((j,i))
            }
        }
    }
    
    var result = 0
    
    while true {
        result += 1
        meltIce()

        
        if ices.isEmpty {
            print("0")
            exit(EXIT_SUCCESS)
        }
        
        if !bfs() {
            print(result)
            exit(EXIT_SUCCESS)
        }
    }
    
    func meltIce() {
        var tempIces = [(x: Int, y: Int)]()
        var copyMap = map
        
        for i in 0 ..< ices.count {
            let ice = ices[i]
            var count = 0
            for j in 0 ..< 4 {
                let nx = ice.x + dx[j]
                let ny = ice.y + dy[j]
                
                if nx < 0 || nx >= M || ny < 0 || ny >= N || map[ny][nx] != 0 {
                    continue
                }
                
                count += 1
            }
            
            copyMap[ice.y][ice.x] -= count
            if copyMap[ice.y][ice.x] > 0 {
                tempIces.append(ice)
            } else {
                copyMap[ice.y][ice.x] = 0
            }
        }
        
        ices = tempIces
        map = copyMap
    }
    
    func bfs() -> Bool {
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: M), count: N)
        var queue = [(x: Int, y: Int)]()
        var index = 0
        
        let first = ices.first!
        queue.append(first)
        visited[first.y][first.x] = true
        
        
        while queue.count > index {
            let point = queue[index]
            
            for i in 0 ..< 4 {
                let nx = point.x + dx[i]
                let ny = point.y + dy[i]
                
                if nx < 0 || nx >= M || ny < 0 || ny >= N || visited[ny][nx] || map[ny][nx] == 0 {
                    continue
                }
                
                visited[ny][nx] = true
                queue.append((nx,ny))
            }
            
            index += 1
        }
        
        return visited.flatMap{ $0 }.filter{ $0 }.count == ices.count
    }
}

main()

