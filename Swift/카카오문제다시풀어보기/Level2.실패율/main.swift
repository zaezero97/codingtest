//
//  main.swift
//  카카오문제다시풀어보기
//
//  Created by 재영신 on 2022/05/01.
//

import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var result = [Double](repeating: 0.0, count: N)
    var temp = [Int](repeating: 0, count: N)
    
    var successUser = 0
    for i in 0 ..< stages.count {
        if stages[i] - 1 != N {
            temp[stages[i] - 1] += 1
        } else {
            successUser += 1
        }
    }
    
    
    for i in 0 ..< N {
        let failUser = temp[i]
        var sum = successUser
        for j in i ..< N {
            sum += temp[j]
        }
        result[i] = Double(failUser) / Double(sum)
    }
        
    return result.enumerated().sorted(by: { $0.element > $1.element }).map { $0.offset + 1}
}

solution(5, [2, 1, 2, 6, 2, 4, 3, 3])
