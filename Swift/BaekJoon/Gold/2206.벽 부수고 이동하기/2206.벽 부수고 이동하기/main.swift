//
//  main.swift
//  2206.벽 부수고 이동하기
//
//  Created by 재영신 on 2022/04/24.
//

import Foundation

func main() {
    let firstInput = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let N = firstInput[0]
    let M = firstInput[1]
    
    var map = [[Int]]()
    for _ in 0 ..< N {
        let input = readLine()!.map{ Int(String($0))! }
        map.append(input)
    }
    
    var visited = [[[Bool]]](repeating: [[Bool]](repeating: [Bool](repeating: false, count: 2), count: M), count: N)
    var distanceMap = [[[Int]]](
        repeating: [[Int]](repeating: [Int](repeating: 0, count: 2), count: M), count: N
    )
    
    let dx = [1, 0, -1, 0]
    let dy = [0, 1, 0, -1]
    
    var queue = [(x: Int, y: Int, isBreaked: Bool)]()
    queue.append((0,0, false))
    var index = 0
    while queue.count > index {
        let point = queue[index]
        
        if point.x == M - 1, point.y == N - 1 {
            print(distanceMap[point.y][point.x][point.isBreaked ? 1 : 0] + 1)
            exit(EXIT_SUCCESS)
        }
        
        for i in 0 ..< 4 {
            let nx = point.x + dx[i]
            let ny = point.y + dy[i]
            
            if nx < 0 || nx >= M || ny < 0 || ny >= N || visited[ny][nx][point.isBreaked ? 1 : 0] {
                continue
            }
            
            if map[ny][nx] == 1, !point.isBreaked {
                visited[ny][nx][0] = true
                distanceMap[ny][nx][1] = distanceMap[point.y][point.x][0] + 1
                queue.append((nx,ny,true))
            }
            
            if map[ny][nx] == 0 {
                visited[ny][nx][point.isBreaked ? 1 : 0] = true
                distanceMap[ny][nx][point.isBreaked ? 1 : 0] = distanceMap[point.y][point.x][point.isBreaked ? 1 : 0] + 1
                queue.append((nx,ny,point.isBreaked))
            }
        }
        
        index += 1
    }
    
    print("-1")
}

main()
