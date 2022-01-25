//
//  main.swift
//  1309.동물원
//
//  Created by 재영신 on 2022/01/25.
//

import Foundation

let N = Int(readLine()!)!

solve()

func solve() {
    
    var dp = [[Int]](repeating: [Int](repeating: 0, count: 3), count: N)
    
    dp[0][0] = 1
    dp[0][1] = 1
    dp[0][2] = 1
    for i in 1 ..< N {
        // 0 -> 줄에 사자가 없는 경우 , 1 -> 왼쪽에 사자가 있는 경우, 2 -> 오른쪽에 사자가 있는 경우
        dp[i][0] = (dp[i-1][0] + dp[i-1][1] + dp[i-1][2]) % 9901
        dp[i][1] = (dp[i-1][0] + dp[i-1][2]) % 9901
        dp[i][2] = (dp[i-1][0] + dp[i-1][1]) % 9901
    }
    
    print("\((dp[N-1][0]+dp[N-1][1]+dp[N-1][2])%9901)")
}
