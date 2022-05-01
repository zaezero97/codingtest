//
//  main.swift
//  카카오문제다시풀어보기
//
//  Created by 재영신 on 2022/05/01.
//

import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    
    var stack = [Int]()
    var result = 0
    var head = -1
    var board = board
    for move in moves {
        for i in 0 ..< board.count {
            if board[i][move-1] != 0 {
                stack.append(board[i][move-1])
                head += 1
                board[i][move-1] = 0
                
                if stack.count <= 1 {
                    break
                }
                
                if stack[head] == stack[head - 1] {
                    stack = [Int](stack[0 ..< head-1])
                    head -= 2
                    result += 2
                }
                
                break
            }
        }
    }
    
    return result
}

print(solution([[0,0,0,0,0],[0,0,1,0,3],[0,2,5,0,1],[4,2,4,4,2],[3,5,1,3,1]], [1,5,3,5,1,2,1,4]))
