//
//  main.swift
//  카카오문제다시풀어보기
//
//  Created by 재영신 on 2022/05/03.
//

import Foundation

func bfs(_ place: [[String]], _ x: Int, _ y: Int) -> Bool {
    
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: 5), count: 5)
    var queue = [(x: Int, y: Int, d: Int)]()
    var index = 0
    
    queue.append((x,y,0))
    visited[y][x] = true
    
    let dx = [1,0,-1,0]
    let dy = [0,1,0,-1]
    
    while queue.count > index {
        let point = queue[index]
        
        for i in 0 ..< 4 {
            let nx = point.x + dx[i]
            let ny = point.y + dy[i]
            
            if nx < 0 || nx >= 5 || ny < 0 || ny >= 5 || visited[ny][nx] {
                continue
            }
            
            if place[ny][nx] == "O", point.d < 2 {
                visited[ny][nx] = true
                queue.append((nx,ny,point.d+1))
            }
            
            if place[ny][nx] == "P", point.d <= 1 {
                return false
            }
        }
        
        index += 1
    }
    
    return true
}

func solution(_ places:[[String]]) -> [Int] {
    
    var result = [Int]()
    for i in 0 ..< places.count {
        let place = places[i].map { Array($0).map { s in String(s)}}
        let beforeCount = result.count
        for j in 0 ..< place.count {
            let line = place[j]
           
            for z in 0 ..< line.count {
                if line[z] == "P" {
                    if !bfs(place, z, j) {
                        result.append(0)
                        break
                    }
                }
            }
            
            if beforeCount != result.count {
                break
            }
        }
       
        if beforeCount == result.count {
            result.append(1)
        }
        
    }
    return result
}

print(solution([["POOOP", "OXXOX", "OPXPX", "OOXOX", "POXXP"], ["POOPX", "OXPXP", "PXXXO", "OXXXO", "OOOPP"], ["PXOPX", "OXOXP", "OXPOX", "OXXOP", "PXPOX"], ["OOOXX", "XOOOX", "OOOXX", "OXOOX", "OOOOO"], ["PXPXP", "XPXPX", "PXPXP", "XPXPX", "PXPXP"]]))
