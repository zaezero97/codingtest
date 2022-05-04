//
//  main.swift
//  카카오문제다시풀어보기
//
//  Created by 재영신 on 2022/05/04.
//

import Foundation

func solution(_ msg:String) -> [Int] {
    
    var dic = [String: Int]()
    var result = [Int]()
    for i in 11 ... 36 {
        dic[String(i - 1, radix: i).uppercased()] = i - 10
    }
    
    var lastIndex = 27
    var input = ""
    var index = 0
    let msg = Array(msg).map { String($0) }
    
    while msg.count > index {
        input += msg[index]
        if dic[input] == nil {
            let c = String(input.removeLast())
            result.append(dic[input]!)
            dic[input + c] = lastIndex
            lastIndex += 1
            input = c
        }
        index += 1
    }
    
    result.append(dic[input]!)
    return result
}

print(solution("ABABABABABABABAB"))
