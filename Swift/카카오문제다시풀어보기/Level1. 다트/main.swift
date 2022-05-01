//
//  main.swift
//  카카오문제다시풀어보기
//
//  Created by 재영신 on 2022/05/01.
//

import Foundation

func solution(_ dartResult:String) -> Int {
    print(dartResult.split(whereSeparator: { $0.isNumber }))
    var result = [Int]()
    let count = dartResult.count
    var i = 0
    while count > i {
        let char = dartResult[dartResult.index(dartResult.startIndex, offsetBy: i)]
        if char.isNumber {
            if char == "1", dartResult[dartResult.index(dartResult.startIndex, offsetBy: i+1)] == "0" {
                let ten = String(char) + String(dartResult[dartResult.index(dartResult.startIndex, offsetBy: i+1)])
                result.append(Int(ten)!)
                i += 2
                continue
            }
            result.append(Int(String(char))!)
        } else {
            switch char {
            case "D":
                let last = result.removeLast()
                result.append(last * last)
            case "T":
                let last = result.removeLast()
                result.append(last * last * last)
            case "*":
                if result.count > 1 {
                    result[result.index(result.endIndex-1, offsetBy: -1)] = result[result.index(result.endIndex-1, offsetBy: -1)] * 2
                }
                result[result.endIndex-1] = result.last! * 2
            case "#":
                result[result.endIndex-1] = result.last! * -1
            default:
                break
            }
        }
        i += 1
    }
    
    return result.reduce(0, +)
}

print(solution("10D4S10D"))
