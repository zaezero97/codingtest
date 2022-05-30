//
//  main.swift
//  10828.스택
//
//  Created by 재영신 on 2022/05/30.
//

import Foundation

func main() {
    let n = Int(readLine()!)!
    
    var stack = [String]()
    for _ in 0 ..< n {
        let input = readLine()!.split(separator: " ").map { String($0)}
        
        switch input[0] {
        case "push":
            stack.append(input[1])
        case "top":
            print(stack.isEmpty ? "-1" : stack.last!)
        case "size":
            print(stack.count)
        case "empty":
            print(stack.isEmpty ? "1" : "0")
        case "pop":
            print(stack.isEmpty ? "-1" : stack.removeLast())
        default:
            break
        }
    }
}

main()
