//
//  main.swift
//  카카오문제다시풀어보기
//
//  Created by 재영신 on 2022/05/04.
//

import Foundation

func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    
    var numbers = [String]()
    var result = ""
    var number = 0
    while (t * m) > numbers.count {
        numbers.append(contentsOf: String(number , radix: n).map{ String($0)})
        number += 1
    }
    
    var t = t
    var index = p - 1
    while t > 0 {
        result += numbers[index]
        t -= 1
        index += m
    }
    
    return result.uppercased()
}

print(solution(2, 4, 2, 1))
