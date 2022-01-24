//
//  main.swift
//  1263.시간관리
//
//  Created by 재영신 on 2022/01/24.
//

import Foundation

let N = Int(readLine()!)!

solve()

func solve() {
    var arr = [(T:Int,S:Int)]()
    for _ in 0 ..< N {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        let T = input[0]
        let S = input[1]
        arr.append((T:T,S:S))
    }
    
    let sortedArr = arr.sorted(by: {
        $0.S > $1.S
    })
    
    var endTime = sortedArr[0].S - sortedArr[0].T
    for i in 1 ..< sortedArr.count {
        if endTime > sortedArr[i].S {
            endTime = sortedArr[i].S
        }
        endTime -= sortedArr[i].T
    }
    
    endTime < 0 ? print("-1") : print(endTime)
}


