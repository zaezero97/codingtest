//
//  main.swift
//  2667.단지번호붙이기
//
//  Created by 재영신 on 2022/01/26.
//

import Foundation

let N = Int(readLine()!)!
let dx = [1,0,-1,0]
let dy = [0,1,0,-1]
solve()

func solve() {
    
    var map = [[Int]](repeating: [Int](repeating: 0, count: N), count: N)
    
    for i in 0 ..< N {
        map[i] = readLine()!.map{ Int(String($0))! }
    }
    var result = [Int]()
    
    for i in 0 ..< N {
        for j in 0 ..< N {
            if map[i][j] == 1 {
                result.append(bfs(i: i, j: j, map: &map))
            }
        }
    }
    
    print(result.count)
    result.sort()
    result.forEach{
        print($0)
    }
}


func bfs(i: Int, j: Int, map: inout [[Int]]) -> Int {
    var n = 0
    var queue = [(x: Int, y: Int)]()

    queue.append((x: j,y: i))
    map[i][j] = 0
    n += 1
    
    while !queue.isEmpty {
        let point = queue.removeFirst()
        for i in 0 ..< 4 {
            let newPoint = (x: point.x + dx[i], y: point.y + dy[i])
            if newPoint.x < N , newPoint.x >= 0 , newPoint.y < N , newPoint.y >= 0 , map[newPoint.y][newPoint.x] == 1 {
                queue.append(newPoint)
                map[newPoint.y][newPoint.x] = 0
                n += 1
            }
        }
    }
    
    return n
}
