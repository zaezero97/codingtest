//
//  main.swift
//  체스판 다시 칠하기
//
//  Created by 재영신 on 2021/12/28.
//

import Foundation

let firstLineInput = readLine()!.components(separatedBy: " ")
let N = Int(firstLineInput[0])! // 8<= N <=50
let M = Int(firstLineInput[1])! // ...

var chess = [[String]](repeating: [String](repeating: "0", count: M), count: N)
var minN: Int = Int.max

for i in 0 ..< N {
    chess[i] = readLine()!.map{ String($0) }
}

for i in 0 ... N - 8 {
    for j in 0 ... M - 8 {
        let n = checkChess(i: i, j: j)
        if minN > n {
            minN = n
        }
    }
}

print(minN)

func checkChess(i: Int,j: Int) -> Int {
    
    var startB = 0
    var startW = 0
    for row in stride(from: i, to: i+8, by: 1) {
        for col in stride(from: j, to: j+8, by: 1) {
            if (row+col) % 2 == 0 {
                if chess[row][col] != "B" {
                    startB += 1
                }
                if chess[row][col] != "W" {
                    startW += 1
                }
            } else {
                if chess[row][col] != "W" {
                    startB += 1
                }
                if chess[row][col] != "B" {
                    startW += 1
                }
            }
        }
    }

    return min(startB, startW)
}


