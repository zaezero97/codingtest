//
//  main.swift
//  2493.탑
//
//  Created by 재영신 on 2022/05/09.
//

import Foundation

func main() {
    let n = Int(readLine()!)!
    
    let towers = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    var stack = [(i: Int, height: Int)]()
    var result = ""
    
    for i in 0 ..< n {
        while true {
            if stack.isEmpty {
                result += "0 "
                break
            }
            
            if stack.last!.height >= towers[i] {
                result += "\(stack.last!.i) "
                break
            } else {
                stack.removeLast()
            }
        }
        stack.append((i+1, towers[i]))
    }
    
    print(result)
}

main()

