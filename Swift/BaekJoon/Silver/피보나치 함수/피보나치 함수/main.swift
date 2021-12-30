//
//  main.swift
//  피보나치 함수
//
//  Created by 재영신 on 2021/12/30.
//

import Foundation

let T = Int(readLine()!)!

var inputArray: [Int] = []
for _ in 0 ..< T {
    inputArray.append(Int(readLine()!)!)
}

for i in 0 ..< inputArray.count {
    if inputArray[i] == 0 {
        print("1 0")
        continue
    } else if inputArray[i] == 1{
       print("0 1")
        continue
    }
    var dp = [[Int]](repeating: [Int](repeating: 0, count: 41), count: 2)
    dp[0][0] = 1
    dp[1][1] = 1
    for j in 2 ... inputArray[i] {
        dp[0][j] = dp[0][j-1] + dp[0][j-2]
        dp[1][j] = dp[1][j-1] + dp[1][j-2]
    }
    
    print(dp[0][inputArray[i]],dp[1][inputArray[i]])
}




