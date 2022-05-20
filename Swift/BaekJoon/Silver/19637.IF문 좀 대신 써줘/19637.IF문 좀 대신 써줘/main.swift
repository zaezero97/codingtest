//
//  main.swift
//  19637.IF문 좀 대신 써줘
//
//  Created by 재영신 on 2022/05/21.
//

import Foundation

func main() {
    let firstInput = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    let n = firstInput[0]
    let m = firstInput[1]
    
    var titles = [(name: String, value: Int)]()
    
    for _ in 0 ..< n {
        let input = readLine()!.split(separator: " ").map { String($0) }
        titles.append((input[0], Int(input[1])!))
    }
    
    for _ in 0 ..< m {
        let power = Int(readLine()!)!
        
        var start = 0
        var end = titles.count - 1
        
        while end >= start {
            let mid = (start + end) / 2
            
            if titles[mid].value < power {
                start = mid + 1
            } else {
                end = mid - 1
            }
        }
        
        print(titles[start].name)
    }
    
    
}

main()


