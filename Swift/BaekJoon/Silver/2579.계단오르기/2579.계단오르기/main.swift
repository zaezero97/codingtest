//
//  main.swift
//  2579.계단오르기
//
//  Created by 재영신 on 2022/01/05.
//

import Foundation

let stairN = Int(readLine()!)!

main()

func main() {
    var stairs = [Int]()
    var dp = [Int](repeating: 0, count: stairN + 1)
    stairs.append(0)
    for _ in 0 ..< stairN {
        stairs.append(Int(readLine()!)!)
    }
    
    if stairN <= 2 {
        print(stairs.reduce(0, +))
        exit(EXIT_SUCCESS)
    }
    dp[0] = stairs[0]
    dp[1] = stairs[1]
    dp[2] = stairs[2] + stairs[1]
    for i in 3 ... stairN {
        dp[i] = max(stairs[i-1] + stairs[i] + dp[i-3], dp[i-2] + stairs[i])
    }
    print(dp)
    print(dp[stairN])
}

