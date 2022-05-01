//
//  Level2.괄호 변환.swift
//  카카오문제다시풀어보기
//
//  Created by 재영신 on 2022/05/01.
//

import Foundation

func solution(_ p:String) -> String {
    
    if checkBracket(p) {
        return p
    }
    
    func firstCalc(_ s: String) -> String {
        if s.isEmpty {
            return ""
        }
        
        let arr = s.map { String($0) }
        var n = 0
        var u = ""
        var v = ""
        
        for i in 0 ..< arr.count {
            if arr[i] == "(" {
                n += 1
            } else {
                n -= 1
            }
            u += arr[i]
            
            if n == 0 {
                v = arr[i+1 ..< arr.count].joined()
                break
            }
        }
        if checkBracket(u) {
            return u + firstCalc(v)
        } else {
            u.removeFirst()
            u.removeLast()
            return "(" + firstCalc(v) + ")" + u.replacingOccurrences(of: "(", with: "A").replacingOccurrences(of: ")", with: "(").replacingOccurrences(of: "A", with: ")")
        }
    }
    
    return firstCalc(p)
}

func checkBracket(_ u: String) -> Bool{
    
    var n = 0
    for char in u {
        if char == "(" {
            n += 1
        } else {
            n -= 1
        }
        if n < 0 {
            return false
        }
    }
    
    if n == 0 {
        return true
    } else {
        return false
    }
}

print(solution("(()())()"))
