//
//  main.swift
//  2512.예산
//
//  Created by 재영신 on 2022/05/20.
//

import Foundation

func main() {
    _ = Int(readLine()!)!
    
    let budgetRequests = readLine()!.split(separator: " ").map { Int(String($0))! }
    let budgesSum = Int(readLine()!)!
    
    var start = 0
    var end = budgetRequests.max()!
    
    while end >= start {
        let mid = (start + end) / 2
        
        var sum = 0
        budgetRequests.forEach {
            sum += $0 >= mid ? mid : $0
        }
        
        if sum <= budgesSum {
            start = mid + 1
        } else {
            end = mid - 1
        }
    }
    
    print(end)
}

main()

