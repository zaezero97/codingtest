//
//  main.swift
//  2473.세 용액
//
//  Created by 재영신 on 2022/05/29.
//

import Foundation

func main() {
    let n = Int(readLine()!)!
    
    let solutions = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted(by: <)
    var min = Int.max
    var result = [Int]()
    
    for i in 0 ..< n - 2 {
        
        var start = i + 1
        var end = n - 1
        
        while end > start {
            let sum = solutions[i] + solutions[start] + solutions[end]
            
            if abs(sum) < min {
                min = abs(sum)
                result = [solutions[i], solutions[start], solutions[end]]
            }
            
            if sum < 0 {
                start += 1
            } else {
                end -= 1
            }
        }
    }
    print(result.sorted(by: <).map { String($0)}.joined(separator: " "))
}

main()

