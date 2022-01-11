//
//  main.swift
//  1495.기타리스트
//
//  Created by 재영신 on 2022/01/11.
//

import Foundation


let NSMinput = readLine()!.split(separator: " ").map { Int(String($0))! }
let volumList = readLine()!.split(separator: " ").map{ Int(String($0))! }
let N = NSMinput[0]
let S = NSMinput[1]
let M = NSMinput[2]

solve()
func solve() {
    
    var arr = [[Bool]](repeating: [Bool](repeating: false, count: M+1), count: N+1)
    arr[0][S] = true
    
    for i in 1 ... N {
        for j in 0 ... M {
            if arr[i-1][j] == false {
                continue
            }
            
            if j + volumList[i-1] <= M {
                arr[i][j + volumList[i-1]] = true
            }
            if j - volumList[i-1] >= 0 {
                arr[i][j - volumList[i-1]] = true
            }
        }
    }
    var max = -1
    for (i,flag) in arr[N].enumerated() {
        if flag == true {
            max = i
        }
    }
    
    print(max)
}

