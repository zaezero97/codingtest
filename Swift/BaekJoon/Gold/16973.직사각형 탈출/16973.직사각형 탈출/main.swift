//
//  main.swift
//  16973.직사각형 탈출
//
//  Created by 재영신 on 2022/04/28.
//

import Foundation

func main() {
    let firstInput = readLine()!.split(separator: " ").map { Int(String($0))! }
    let N = firstInput[0]
    let M = firstInput[1]
    
    var map = [[Int]]()
    var walls = [(r: Int, c: Int)]()
    for i in 0 ..< N {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        map.append(input)
        for j in 0 ..< M {
            if map[i][j] == 1 {
                walls.append((i,j))
            }
        }
    }
    
    let lastInput = readLine()!.split(separator: " ").map { Int(String($0))! }
    let H = lastInput[0]
    let W = lastInput[1]
    let startRow = lastInput[2] - 1
    let startCol = lastInput[3] - 1
    let finishRow = lastInput[4] - 1
    let finishCol = lastInput[5] - 1
    
    let dr = [1,0,-1,0]
    let dc = [0,1,0,-1]
    
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: M), count: N)
    
    
    func bfs() {
        var queue = [(r: Int, c: Int, d: Int)]()
        queue.append((startRow,startCol, 0))
        visited[startRow][startCol] = true
        
        var index = 0
        
        while queue.count > index {
            let curLocation = queue[index]
            
            if curLocation.r == finishRow, curLocation.c == finishCol {
                print(curLocation.d)
                exit(EXIT_SUCCESS)
            }
            
            for i in 0 ..< 4 {
                let nr = curLocation.r + dr[i]
                let nc = curLocation.c + dc[i]
                
                if nr < 0 || nr + H > N || nc < 0 || nc + W > M || visited[nr][nc] {
                    continue
                }
                
                if checkWall(nr,nc) {
                    visited[nr][nc] = true
                    queue.append((nr,nc, curLocation.d + 1))
                }
            }
            
            index += 1
        }
    }
    
    func checkWall(_ r: Int, _ c: Int) -> Bool {
        
//        for i in r ... r+H-1 {
//            for j in c ... c+W-1 {
//                if map[i][j] == 1 {
//                    return false
//                }
//            }
//        }
        for wall in walls {
            if (r..<r+H).contains(wall.r), (c..<c+W).contains(wall.c) {
                return false
            }
        }
        
        return true
    }
    
    bfs()
    print("-1")
}

main()

