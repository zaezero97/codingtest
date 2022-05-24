//
//  main.swift
//  2470.두 용액
//
//  Created by 재영신 on 2022/05/24.
//

import Foundation

func main() {
    let n = Int(readLine()!)!
    
    let solutions = readLine()!.split(separator: " ").map{ Int(String($0))! }.sorted(by: <)
    
    var start = 0
    var end = n - 1
    var answer = (0,0)
    var min = Int.max
    
    while end > start {
        let sum = solutions[end] + solutions[start]
        
        if abs(sum) < min {
            min = abs(sum)
            answer = (solutions[start], solutions[end])
            
            if sum == 0 {
                break
            }
            
        }
        
        if sum > 0 {
            end -= 1
        } else {
            start += 1
        }
    }
    
    print("\(answer.0) \(answer.1)")
}

main()
