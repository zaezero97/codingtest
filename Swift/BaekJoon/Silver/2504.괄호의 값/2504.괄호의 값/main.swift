//
//  main.swift
//  2504.괄호의 값
//
//  Created by 재영신 on 2022/05/10.
//

import Foundation

func main() {
    let str = readLine()!.map { String($0) }
    var stack = [String]()
    var temp = 1
    var result = 0
    
    for i in 0 ..< str.count {
        
        switch str[i] {
        case "(":
            temp *= 2
            stack.append(str[i])
        case ")":
            if stack.isEmpty || stack.last! != "(" {
                print("0")
                exit(EXIT_SUCCESS)
            }
            
            if str[i-1] == "(" {
                result += temp
                temp /= 2
                stack.removeLast()
            } else {
                temp /= 2
                stack.removeLast()
            }
            
        case "[":
            temp *= 3
            stack.append(str[i])
        case "]":
            if stack.isEmpty || stack.last! != "[" {
                print("0")
                exit(EXIT_SUCCESS)
            }
            
            if str[i-1] == "[" {
                result += temp
                temp /= 3
                stack.removeLast()
            } else {
                temp /= 3
                stack.removeLast()
            }
            
        default:
            break
        }
    }
    
    if !stack.isEmpty {
        print("0")
        exit(EXIT_SUCCESS)
    }
    print(result)
}

main()
