//
//  main.swift
//  2178.미로
//
//  Created by 재영신 on 2022/01/19.
//

import Foundation

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let N = input[0]
let M = input[1]
let dx = [0 , 1 , 0 , -1]
let dy = [1, 0, -1, 0]
func solve() {
    var map = [[Int]](repeating: [Int](repeating: 0, count: M), count: N)
    
    for i in 0 ..< N {
        map[i] = readLine()!.map { Int(String($0))!}
    }
    
    var queue: [(x:Int, y:Int)] = []
    
    queue.append((x:0,y:0))
    
    while !queue.isEmpty {
        let point = queue.removeFirst()
        for i in 0 ..< 4 {
            let newPoint = (x: point.x+dx[i],y: point.y+dy[i])
            if newPoint.x >= 0,newPoint.x < M , newPoint.y >= 0 , newPoint.y < N ,map[newPoint.y][newPoint.x] == 1{
                map[newPoint.y][newPoint.x] = map[point.y][point.x] + 1
                queue.append(newPoint)
            }
        }
    }
    
    print(map[N - 1][M - 1])
}
solve()
