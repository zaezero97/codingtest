//
//  main.swift
//  1600.말이 되고픈 원숭이
//
//  Created by 재영신 on 2022/04/30.
//

import Foundation

func main() {
    let K = Int(readLine()!)!
    let secondInput = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    let W = secondInput[0]
    let H = secondInput[1]
    
    var map = [[Int]]()
    var visited = [[[Bool]]](repeating: [[Bool]](repeating: [Bool](repeating: false, count: K+1), count: W), count: H)
    
    for _ in 0 ..< H {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        map.append(input)
    }
    
    var queue = [(x: Int, y: Int, k: Int, d: Int)]()
    let dx = [1, 0, -1, 0]
    let dy = [0, 1, 0, -1]
    
    let horseX = [1,2,2,1,-1,-2,-2,-1]
    let horseY = [2,1,-1,-2,-2,-1,1,2]
    
    queue.append((0, 0, K, 0))
    visited[0][0][K] = true
    var index = 0
    
    while queue.count > index {
        let monkey = queue[index]
        if monkey.x == W - 1 , monkey.y == H - 1 {
            print(monkey.d)
            exit(EXIT_SUCCESS)
        }
        
        for i in 0 ..< 4 {
            let nx = monkey.x + dx[i]
            let ny = monkey.y + dy[i]
            
            if nx >= 0 && nx < W && ny >= 0 && ny < H && !visited[ny][nx][monkey.k] && map[ny][nx] != 1 {
                visited[ny][nx][monkey.k] = true
                queue.append((nx,ny, monkey.k, monkey.d + 1))
            }
        }
        
        if monkey.k > 0 {
            for j in 0 ..< 8 {
                let nx = monkey.x + horseX[j]
                let ny = monkey.y + horseY[j]
                
                if nx >= 0 && nx < W && ny >= 0 && ny < H && monkey.k > 0 && !visited[ny][nx][monkey.k-1] && map[ny][nx] != 1 {
                    visited[ny][nx][monkey.k-1] = true
                    queue.append((nx,ny, monkey.k - 1, monkey.d+1))
                }
            }
        }
        index += 1
    }
    print("\(-1)")
}

main()

