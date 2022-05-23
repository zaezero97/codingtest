//
//  main.swift
//  3079.입국 심사
//
//  Created by 재영신 on 2022/05/23.
//

import Foundation

func main() {
    let firstInput = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    let n = firstInput[0]
    let m = firstInput[1]
    
    var times = [Int]()
    
    for _ in 0 ..< n {
        times.append(Int(readLine()!)!)
    }
    
    times.sort(by: <)
    
    var start = 0
    var end = times.last! * m
    var answer = 0
    
    while end >= start {
        let mid = (start + end) / 2
        
        var passN = 0
        
        for i in 0 ..< n {
            passN += mid / times[i]
        }
        
        if passN >= m {
            answer = mid
            end = mid - 1
        } else {
            start = mid + 1
        }
    }
    
    print(answer)
}

main()

