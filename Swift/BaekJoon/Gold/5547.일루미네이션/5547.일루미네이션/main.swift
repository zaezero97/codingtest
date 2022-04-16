//
//  main.swift
//  5547.일루미네이션
//
//  Created by 재영신 on 2022/04/16.
//

import Foundation

func main() {
    let firstInput = readLine()!.split(separator: " ").map { Int(String($0))! }
    let W = firstInput[0]
    let H = firstInput[1]
    
    var map = [[Int]]()
    map.append([Int](repeating: 0, count: W+2))
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: W+2), count: H+2)
    let odd_x = [-1, 1, 0, 1, 0, 1]
    let odd_y = [ 0, 0, 1, 1,-1,-1]
    let even_x = [-1, 1, -1, 0, 0,-1]
    let even_y = [ 0, 0, -1,-1, 1, 1]
    
    for _ in 0 ..< H {
        var line = readLine()!.split(separator: " ").map { Int(String($0))! }
        line = [0] + line + [0]
        map.append(line)
    }
    map.append([Int](repeating: 0, count: W+2))
    
    print(bfs(0,0))
    
    func bfs(_ x: Int, _ y: Int) -> Int {
        var queue = [(x: Int, y: Int)]()
        var result = 0
        
        queue.append((x,y))
        visited[y][x] = true
        
        
        while !queue.isEmpty {
            
            let point = queue.removeFirst()
            
            if point.y % 2 == 0 {
                for i in 0 ..< 6 {
                    let nx = point.x + even_x[i]
                    let ny = point.y + even_y[i]
                    
                    if nx < 0 || nx >= W+2 || ny < 0 || ny >= H+2 {
                        continue
                    }
                    
                    if map[ny][nx] == 1 {
                        result += 1
                    } else if map[ny][nx] == 0, !visited[ny][nx] {
                        queue.append((nx,ny))
                        visited[ny][nx] = true
                    }
                    
                }
            } else {
                for i in 0 ..< 6 {
                    let nx = point.x + odd_x[i]
                    let ny = point.y + odd_y[i]
                    
                    if nx < 0 || nx >= W+2 || ny < 0 || ny >= H+2 {
                        continue
                    }
                    
                    if map[ny][nx] == 1 {
                        result += 1
                    } else if map[ny][nx] == 0, !visited[ny][nx] {
                        queue.append((nx,ny))
                        visited[ny][nx] = true
                    }
                    
                }
            }
        }
        
        
        return result
    }
}

main()
