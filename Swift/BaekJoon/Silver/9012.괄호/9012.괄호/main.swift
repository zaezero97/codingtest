//
//  main.swift
//  9012.괄호
//
//  Created by 재영신 on 2022/05/31.
//

import Foundation

func main() {
    let t = Int(readLine()!)!
    
    for _ in 0 ..< t {
        var count = 0
        
        let input = readLine()!.map { String($0) }
        for i in 0 ..< input.count {
            if input[i] == "(" {
                count += 1
            } else {
                count -= 1
            }
            
            if count < 0 {
                break
            }
        }
        
        if count == 0 {
            print("YES")
        } else {
            print("NO")
        }
    }
}

main()

