//
//  main.swift
//  2693.N번째 큰 수
//
//  Created by 재영신 on 2022/06/03.
//

import Foundation

let inputN = Int(readLine() ?? "") ?? 0

for _ in 0..<inputN {
    let input = (readLine() ?? "").split {$0 == " "}.compactMap { Int($0) }
    print(input.sorted()[input.count-3])
}

