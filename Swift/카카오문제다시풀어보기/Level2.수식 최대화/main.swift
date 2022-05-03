//
//  main.swift
//  카카오문제다시풀어보기
//
//  Created by 재영신 on 2022/05/03.
//

import Foundation

func solution(_ expression:String) -> Int64 {
    let priotys = [["*", "+", "-"], ["*", "-", "+"], ["+", "-", "*"], ["+", "*", "-"], ["-", "+", "*"], ["-", "*", "+"]]
    
    var max: Int64 = 0
    
    for i in 0 ..< priotys.count {
        let prioty = priotys[i]
        var numbers = expression.split(whereSeparator: { !$0.isNumber} ).map { Int64($0)! }
        var ops = expression.split(whereSeparator: { $0.isNumber }).map { String($0) }
        
        for j in 0 ..< 3 {
            
            if !ops.contains(prioty[j]) {
                continue
            }
            
            var index = 0
            
            while ops.count > index {
                if ops[index] == prioty[j] {
                    switch prioty[j] {
                    case "+":
                        let n1 = numbers.remove(at: index)
                        let n2 = numbers.remove(at: index)
                        numbers.insert(n1 + n2, at: index)
                        ops.remove(at: index)
                    case "-":
                        let n1 = numbers.remove(at: index)
                        let n2 = numbers.remove(at: index)
                        numbers.insert(n1 - n2, at: index)
                        ops.remove(at: index)
                    case "*":
                        let n1 = numbers.remove(at: index)
                        let n2 = numbers.remove(at: index)
                        numbers.insert(n1 * n2, at: index)
                        ops.remove(at: index)
                    default:
                        break
                    }
                    
                    continue
                }
                
                index += 1
            }
        }
        if abs(numbers.first!) > max {
            max = abs(numbers.first!)
        }
    }
    return max
}

print(solution("100-200*300-500+20"))
