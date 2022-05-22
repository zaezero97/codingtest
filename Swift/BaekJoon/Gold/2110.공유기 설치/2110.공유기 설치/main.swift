//
//  main.swift
//  2110.공유기 설치
//
//  Created by 재영신 on 2022/05/22.
//

import Foundation

func main() {
    let firstInput = readLine()!.split(separator: " ").map { Int(String($0))! }
    let n = firstInput[0]
    let c = firstInput[1]
    
    var points = [Int]()
    for _ in 0 ..< n {
        points.append(Int(readLine()!)! )
    }
    
    points.sort(by: <)
    
    var start = 0
    var end = points.last! - points.first!
    var result = 0
    
    while end >= start {
        let mid = (start + end) / 2
        
        var prev = points[0]
        var count = 1
        for i in 1 ..< n {
            if points[i] - prev >= mid {
                prev = points[i]
                count += 1
            }
        }
        
        if count >= c {
            result = mid
            start = mid + 1
        } else {
            end = mid - 1
        }
    }
    print(result)
}

main()
