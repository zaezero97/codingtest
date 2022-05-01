//
//  main.swift
//  카카오문제다시풀어보기
//
//  Created by 재영신 on 2022/05/01.
//

import Foundation

func solution(_ s:String) -> Int {
    let numbers = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]

    var result = s
    for (index,number) in numbers.enumerated() {
        result = result.replacingOccurrences(of: number, with: String(index))
    }
    return Int(result)!
}
