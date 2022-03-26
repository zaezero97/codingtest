//
//  main.swift
//  LINECT01. 로그수집
//
//  Created by 재영신 on 2022/03/26.
//

import Foundation

func solution(_ arr:[Int], _ brr:[Int]) -> Int {
    
    var result = 0
    var arr = arr
    
    for i in 0 ..< arr.count - 1{
        if arr[i] != brr[i] {
            let dis = brr[i] - arr[i]
            arr[i] += dis
            arr[i+1] -= dis
            result += 1
        }
    }
    
    return result
}

let _ = solution([6, 2, 2, 6], [4, 4, 4, 4])
