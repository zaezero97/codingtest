//
//  main.swift
//  카카오문제다시풀어보기
//
//  Created by 재영신 on 2022/05/03.
//

import Foundation

struct Point: Hashable {
    let x: Int
    let y: Int
}

func bruteForce(_ board:[[String]], _ m: Int, _ n: Int) -> Set<Point>{
    var points = Set<Point>()
    for i in 0 ..< m - 1 {
        for j in 0 ..< n - 1 {
            if board[i][j] == "X" {
                continue
            }
            
            if board[i][j] == board[i][j+1], board[i][j] == board[i+1][j], board[i][j] == board[i+1][j+1] {
                points.insert(Point(x: j, y: i))
                points.insert(Point(x: j, y: i+1))
                points.insert(Point(x: j+1, y: i))
                points.insert(Point(x: j+1, y: i+1))
            }
        }
    }
    return points
}

func removeBlock(_ removePoints: Set<Point>, board: inout [[String]]) {
    
    for removePoint in removePoints {
        board[removePoint.y][removePoint.x] = "X"
    }
}

func downBlock(board: inout [[String]], _ m: Int, _ n: Int) {
    for i in 0 ..< n {
        for j in stride(from: m - 1, through: 0, by: -1) {
            if board[j][i] == "X" {
                var y = j - 1
                while y >= 0 {
                    if board[y][i] != "X" {
                        board[j][i] = board[y][i]
                        board[y][i] = "X"
                        break
                    }
                    y -= 1
                }
            }
        }
    }
}

func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    
    var result = 0
    var board = board.map{ Array($0).map { String($0) }}
    while true {
        let removePoints = bruteForce(board, m, n)
        result += removePoints.count
        if removePoints.isEmpty {
            break
        }
        removeBlock(removePoints, board: &board)
        downBlock(board: &board, m, n)
    }
    return result
}

print(solution(4, 5, ["CCBDE",
                      "AAADE",
                      "AAABF",
                      "CCBBF"]))
