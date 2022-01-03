//
//  main.swift
//  숫자 정사각형
//
//  Created by 재영신 on 2022/01/03.
//

import Foundation

let input = readLine()!.components(separatedBy: " ").compactMap { Int($0) }
let N = input[0]
let M = input[1]

var rectangle = [[Int]](repeating: [Int](repeating: 0, count: M), count: N)

for i in 0 ..< N {
    rectangle[i] = readLine()!.map{ String($0) }.map{ Int($0)! }
}
    

var max = 1

for i in 0 ..< N - 1 {
    for j in 0 ..< M - 1{
        for z in 1 ..< (N - i > M - j ? M - j : N - i) {
            if rectangle[i][j] == rectangle[i][j+z] , rectangle[i][j] == rectangle[i+z][j], rectangle[i][j] == rectangle[i+z][j+z] {
                
                if max < z + 1 {
                    max = z + 1
                }
            }
        }
    }
}

print(max * max)
