//
//  main.swift
//  1로 만들기
//
//  Created by 재영신 on 2022/01/03.
//

import Foundation

var N = Int(readLine()!)!
var dp = [Int](repeating: 0, count: N + 2)

dp[1] = 0
dp[2] = 1
for i in 2 ..< N + 1 {
    dp[i] = dp[i-1] + 1
    if i % 3 == 0 {
        dp[i] = min(dp[i],dp[i/3] + 1)
    }
    if i % 2 == 0 {
        dp[i] = min(dp[i], dp[i/2] + 1)
    }
}
print(dp[N])

