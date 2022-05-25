//
//  main.swift
//  20444.색종이와 가위
//
//  Created by 재영신 on 2022/05/25.
//

import Foundation

func main() {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    let n = input[0]
    let k = input[1]
    
    var start = 0
    var end = n / 2
    
    while end >= start {
        let mid = (start + end) / 2
        let pieceN = (mid + 1) * (n - mid + 1)
        if pieceN == k {
            print("YES")
            exit(EXIT_SUCCESS)
        }
        
        if pieceN > k {
            end = mid - 1
        } else if pieceN < k {
            start = mid + 1
        }
    }
    
    print("NO")
}

main()

