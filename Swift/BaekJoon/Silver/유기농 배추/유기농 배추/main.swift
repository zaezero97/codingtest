//
//  main.swift
//  유기농 배추
//
//  Created by 재영신 on 2022/01/04.
//

import Foundation

let T = Int(readLine()!)!

for _ in 0 ..< T {
    main()
}


func main() {
    let field = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let M = field[0] // 배추밭의 가로길이
    let N = field[1] // 배추밭의 세로길이
    let K = field[2] // 배추가 심어져 있는 위치의 개수
    var cabbages = [[Int]](repeating: [Int](repeating: 0, count: M), count: N)
    
    for _ in 0 ..< K {
        let pos = readLine()!.split(separator: " ").map{ Int(String($0))! }
        cabbages[pos[1]][pos[0]] = 1
    }
        
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: M), count: N)
    var result = 0
    for i in 0 ..< N {
        for j in 0 ..< M {
            if !visited[i][j], cabbages[i][j] == 1 {
                bfs(x: j, y: i, visited: &visited,cabbages: cabbages,M: M,N: N)
                result += 1
            }
        }
    }
    print(result)
}

func bfs(x: Int, y: Int, visited: inout [[Bool]], cabbages: [[Int]],M: Int,N: Int) {

    var queue = [(x:Int,y:Int)]()
    
    queue.append((x:x,y:y))
    
    while !queue.isEmpty {
        let point = queue.removeFirst()
       
        if point.x+1 < M , !visited[point.y][point.x+1], cabbages[point.y][point.x+1] == 1 {
            visited[point.y][point.x+1] = true
            queue.append((x: point.x+1, y: point.y))
        }
        if point.y+1 < N , !visited[point.y+1][point.x], cabbages[point.y+1][point.x] == 1 {
            visited[point.y+1][point.x] = true
            queue.append((x: point.x, y: point.y+1))
        }
        if point.x-1 >= 0 , !visited[point.y][point.x - 1], cabbages[point.y][point.x - 1] == 1 {
            visited[point.y][point.x-1] = true
            queue.append((x: point.x - 1, y: point.y))
        }
        if point.y-1 >= 0 , !visited[point.y-1][point.x], cabbages[point.y-1][point.x] == 1{
            visited[point.y-1][point.x] = true
            queue.append((x: point.x, y: point.y-1))
        }
    }
    
}




