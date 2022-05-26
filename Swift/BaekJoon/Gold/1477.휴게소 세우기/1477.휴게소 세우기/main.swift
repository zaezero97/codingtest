//
//  main.swift
//  1477.휴게소 세우기
//
//  Created by 재영신 on 2022/05/26.
//

import Foundation

func main() {
    let firstInput = readLine()!.split(separator: " ").map { Int(String($0))! }
    _ = firstInput[0]
    let m = firstInput[1]
    let l = firstInput[2]
    
    var points = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted(by: <)
    points.append(l)
    points.insert(0, at: 0)
    var answer = 0
    var start = 1
    var end = l
    
    while end >= start {
        let mid = (start + end) / 2
        
        var count = 0
        
        for i in 1 ..< points.count {
            let dis = points[i] - points[i-1]
            count += (dis - 1) / mid
        }
        
        if count > m {
            start = mid + 1
        } else {
            answer = mid
            end = mid - 1
        }
    }
    
    print(answer)
}

main()

