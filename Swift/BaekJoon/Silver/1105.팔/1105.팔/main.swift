//
//  main.swift
//  1105.팔
//
//  Created by 재영신 on 2022/01/10.
//

import Foundation


let input = readLine()!.components(separatedBy: " ")

let L = Array(input[0])
let R = Array(input[1])

solution()

func solution() {
    var count = 0
    
    if L.count != R.count {
        print("0")
        return
    }
    
    for i in 0 ..< L.count {
        if L[i] == R[i], L[i] == "8" {
            count += 1
        } else if L[i] != R[i] {
            print(count)
            return
        }
    }
    
    print(count)
}
