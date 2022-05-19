//
//  main.swift
//  1654.랜전 자르기
//
//  Created by 재영신 on 2022/05/19.
//

import Foundation

func main() {
    let firstInput = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let k = firstInput[0]
    let n = firstInput[1]
    
    var lines = [Int]()
    
    for _ in 0 ..< k {
        lines.append(Int(readLine()!)!)
    }
    
    var start = 1
    var end = lines.max()!
    var result = 0
    
    while end >= start {
        let mid = (start + end) / 2

        var sum = 0
        lines.forEach {
            sum += ($0 / mid)
        }
        
        if sum >= n {
            if result < mid {
                result = mid
            }
            start = mid + 1
        } else {
            end = mid - 1
        }
    }
    
    print(result)
}

main()
