//
//  main.swift
//  1541.잃어버린 괄호
//
//  Created by 재영신 on 2022/01/12.
//

import Foundation

let input = readLine()!

solve()

func solve() {
    
    let subSplitedArr = input.split(separator: "-").map{ String($0) }
    var result = [Int]()
    
    for arr in subSplitedArr {
        let addSplitedArr = arr.split(separator: "+").map{String($0)}
        var sum = 0
        for n in addSplitedArr {
            sum += Int(n)!
        }
        result.append(sum)
    }
    
    var answer = result.first!
    for i in 1 ..< result.count {
        answer -= result[i]
    }
    print(answer)
}
