//
//  main.swift
//  17266.어두운 굴다리
//
//  Created by 재영신 on 2022/05/28.
//

import Foundation

func main() {
    let n = Int(readLine()!)!
    _ = Int(readLine()!)!
    let points = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    var low = 0
    var high = n
    var answer = 0
    while high >= low {
        let mid = (low + high) / 2
        var last = 0
        var flag = true
        for i in 0 ..< points.count {
            if points[i] - mid > last {
                flag = false
                break
            } else {
                last = points[i] + mid
            }
        }
        
        if last < n {
            flag = false
        }
        
        if flag {
           answer = mid
            high = mid - 1
        } else {
            low = mid + 1
        }
    
    }
    
    print(answer)
}

main()

