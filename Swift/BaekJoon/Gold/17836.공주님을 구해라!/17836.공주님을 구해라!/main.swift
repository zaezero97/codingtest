//
//  main.swift
//  17836.공주님을 구해라!
//
//  Created by 재영신 on 2022/05/04.
//

import Foundation

func main() {
    let firstInput = readLine()!.split(separator: " ").map { Int(String($0))! }
    let N = firstInput[0]
    let M = firstInput[1]
    let T = firstInput[2]
    
    var map = [[Int]]()
    
    for _ in 0 ..< N {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        map.append(input)
    }
    
    var visited = [[[Bool]]](repeating: [[Bool]](repeating: [Bool](repeating: false, count: 2), count: M), count: N)
    var queue = [(x: Int, y: Int, ishaved: Bool, t: Int)]()
    let dx = [1,0,-1,0]
    let dy = [0,1,0,-1]
    var index = 0
    
    queue.append((0,0, false, T))
    visited[0][0][0] = true
    
    while queue.count > index {
        let point = queue[index]
        
        if point.x == M - 1, point.y == N - 1 {
            print("\(T - point.t)")
            exit(EXIT_SUCCESS)
        }
        
        if point.t == 0 {
            print("Fail")
            exit(EXIT_SUCCESS)
        }
        
        for i in 0 ..< 4 {
            let nx = point.x + dx[i]
            let ny = point.y + dy[i]
            
            if nx < 0 || nx >= M || ny < 0 || ny >= N || visited[ny][nx][point.ishaved ? 1 : 0] {
                continue
            }
            
            if map[ny][nx] == 2 {
                queue.append((nx,ny,true, point.t - 1))
                visited[ny][nx][1] = true
            } else if (map[ny][nx] == 1 && point.ishaved) || map[ny][nx] == 0 {
                queue.append((nx,ny,point.ishaved, point.t - 1))
                visited[ny][nx][point.ishaved ? 1 : 0] = true
            }
        }
        index += 1
    }
    print("Fail")
    
}

main()
