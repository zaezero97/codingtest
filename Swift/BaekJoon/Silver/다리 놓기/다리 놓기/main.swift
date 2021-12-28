//
//  main.swift
//  다리 놓기
//
//  Created by 재영신 on 2021/12/28.
//

import Foundation

let T: Int = Int(readLine()!)!
var input: [(N: Int, M: Int)] = []
var output: [Int] = []
var res = Array(repeating: Array(repeating: 0, count: 31), count: 31)
for _ in 0 ..< T {
    let value = readLine()!.components(separatedBy: " ").compactMap{ Int($0) }
    input.append((N:value[0],M:value[1]))
}



for i in 0 ..< input.count {
    output.append(combination(n:input[i].M,r:input[i].N))
    
}

output.forEach {
    print($0)
}

func combination(n: Int,r: Int) -> Int{
    if n == r || r == 0 {
        return 1
    }
    
    if res[n][r] != 0 {
        return res[n][r]
    }
    
    res[n][r] = combination(n: n-1, r: r-1) + combination(n: n-1, r: r)
    return res[n][r]
}



