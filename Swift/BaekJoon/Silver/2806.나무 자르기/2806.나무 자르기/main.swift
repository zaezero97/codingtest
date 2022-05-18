//
//  main.swift
//  2806.나무 자르기
//
//  Created by 재영신 on 2022/05/18.
//

import Foundation

func main() {
    let firstInput = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    _ = firstInput[0]
    let m = firstInput[1]
    
    let trees = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    var start = trees.min()!
    var end = trees.max()!
    var result = 0
    
    while end >= start {
        let mid = (end + start) / 2
        var sum = 0
        trees.forEach {
            sum += ($0 - mid) > 0 ? ($0 - mid) : 0
        }
        
        if m <= sum {
            if result < mid {
                result = mid
            }
            start = mid + 1
        } else {
            end = mid - 1
        }
    }
    
    print(result)
}

main()

