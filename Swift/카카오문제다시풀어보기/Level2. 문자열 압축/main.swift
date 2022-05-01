//
//  main.swift
//  카카오문제다시풀어보기
//
//  Created by 재영신 on 2022/05/01.
//

import Foundation

func solution(_ s:String) -> Int {
    
    let halfCount = s.count / 2 + 1
    let count = s.count
    let arr = Array(s).map { String($0) }
    var min = Int.max

    if s.count == 1 {
        return 1
    }
    
    for i in stride(from: 1, to: halfCount, by: 1) {
        var index = i
        var subStr = arr[0 ..< i].joined()
        var compN = 1
        var result = ""
        while count > index {
            if index + i > count {
                break
            }
            
            if arr[index ..< index+i].joined() == subStr {
                compN += 1
            } else {
                if compN > 1 {
                    result += String(compN) + subStr
                } else {
                    result += subStr
                }
                
                subStr = arr[index ..< index+i].joined()
                compN = 1
            }
            index += i
        }
        
        if compN > 1 {
            result += String(compN) + subStr
        } else {
            result += subStr
        }
        
        if index + i > count {
            result += arr[index ..< count].joined()
        }
        
        if min > result.count {
            min = result.count
        }
    }
    return min
}

print(solution("ababcdcdababcdcd"))
