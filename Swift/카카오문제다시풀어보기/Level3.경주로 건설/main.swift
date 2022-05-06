//
//  main.swift
//  카카오문제다시풀어보기
//
//  Created by 재영신 on 2022/05/06.
//

import Foundation

func solution(_ board:[[Int]]) -> Int {
    
    var visited = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: 0, count: 2), count: board[0].count), count: board.count)
    var queue = [(x: Int, y: Int, dx: Int, dy: Int, cost: Int)]()
    
    var index = 0
    queue.append((0, 0, 0, 0, 0))
    
    let dx = [1,0,-1,0]
    let dy = [0,1,0,-1]
    var min = Int.max
    
    while queue.count > index {
        let car = queue[index]
        print(car)
        if car.x == board[0].count - 1, car.y == board.count - 1 {
            let cost = car.cost - 500
            if min > cost {
                min = cost
            }
        }
        
        for i in 0 ..< 4 {
            let nx = car.x + dx[i]
            let ny = car.y + dy[i]
            
            if nx < 0 || nx >= board[0].count || ny < 0 || ny >= board.count || board[ny][nx] == 1 {
                continue
            }
            var newCost = car.cost
            var flag = 0
            if car.dx == 0 , dx[i] != 0 {
                newCost += 500
                flag = 1
            } else if car.dy == 0, dy[i] != 0 {
                newCost += 500
                flag = 1
            }
            newCost += 100
            
            if visited[ny][nx][flag] == 0 || visited[ny][nx][flag] >= newCost {
                queue.append((nx,ny,dx[i], dy[i], newCost))
                visited[ny][nx][flag] = newCost
            }
        }
        index += 1
    }
    
    return min
}

print(solution(    [[0, 0, 1, 0], [0, 0, 0, 0], [0, 1, 0, 1], [1, 0, 0, 0]]))
