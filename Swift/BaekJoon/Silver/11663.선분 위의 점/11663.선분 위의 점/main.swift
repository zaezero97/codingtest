//
//  main.swift
//  11663.선분 위의 점
//
//  Created by 재영신 on 2022/05/21.
//

import Foundation

func main() {
    let firstInput = readLine()!.split(separator: " ").map { Int(String($0))! }
    _ = firstInput[0]
    let m = firstInput[1]
    
    let points = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted(by: <)
        
    for _ in 0 ..< m {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        
        let left = input[0]
        let right = input[1]
        
        var start = 0
        var end = points.count - 1
        var sum = m
        
        while end >= start {
            let mid = (start + end) / 2
            
            if points[mid] < left {
                start = mid + 1
            } else {
                end = mid - 1
            }
        }
        sum -= start
        
        start = 0
        end = points.count - 1
        while end >= start {
            let mid = (start + end) / 2
            
            if points[mid] > right {
                end = mid - 1
            } else {
                start = mid + 1
            }
        }
        sum -= (m - end - 1)
        print(sum)
    }
}
main()

