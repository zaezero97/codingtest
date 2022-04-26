//
//  main.swift
//  16932.모양 만들기
//
//  Created by 재영신 on 2022/04/26.
//

import Foundation

func main() {
    let firstInput = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let N = firstInput[0]
    let M = firstInput[1]
    
    let dx = [1,0,-1,0]
    let dy = [0,1,0,-1]
    var max = 0
    var n = 1
    var map = [[Int]](repeating: [Int](repeating: 0, count: M), count: N)
    var group = [Int]()
    var waitQueue = [(x: Int, y: Int)]()
    for i in 0 ..< N {
        let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
        for j in 0 ..< M {
            if input[j] == 0 {
                waitQueue.append((j,i))
            } else {
                map[i][j] = input[j]
            }
        }
    }
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: M), count: N)
    
    for i in 0 ..< N {
        for j in 0 ..< M {
            if !visited[i][j], map[i][j] == 1 {
                bfs(j,i)
                n += 1
            }
        }
    }
    
    for point in waitQueue {
        var set = Set<Int>()
        for i in 0 ..< 4 {
            let nx = point.x + dx[i]
            let ny = point.y + dy[i]
            if nx < 0 || nx >= M || ny < 0 || ny >= N || map[ny][nx] == 0 {
                continue
            }
            set.insert(map[ny][nx])
        }
        
        var sum = 0
        set.forEach { groupNum in
            sum += group[groupNum - 1]
        }
        sum += 1
        
        if max < sum {
            max = sum
        }
    }
    
    print(max)
    func bfs(_ x: Int, _ y: Int) {
        var queue = [(x: Int, y: Int)]()
        
        queue.append((x,y))
        var index = 0
        visited[y][x] = true
        map[y][x] = n
        var answer = 1
        while queue.count > index {
            let point = queue[index]
            
            for i in 0 ..< 4 {
                let nx = point.x + dx[i]
                let ny = point.y + dy[i]
                
                if nx < 0 || nx >= M || ny < 0 || ny >= N || visited[ny][nx] || map[ny][nx] == 0 {
                    continue
                }
                
                answer += 1
                visited[ny][nx] = true
                map[ny][nx] = n
                queue.append((nx,ny))
            }
            
            index += 1
        }
        
        group.append(answer)
    }
}

main()

