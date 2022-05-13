//
//  main.swift
//  1918.후위 표기식
//
//  Created by 재영신 on 2022/05/13.
//

import Foundation

func main() {
    let experssion = readLine()!
    
    var stack = [Character]()
    var result = ""
    
    for char in experssion {
        switch char {
        case "A"..."Z":
            result += String(char)
        case "(":
            stack.append(char)
        case ")":
            while !stack.isEmpty, stack.last! != "(" {
                result += String(stack.removeLast())
            }
            stack.removeLast()
        case "*","/":
            while !stack.isEmpty, (stack.last! == "*" || stack.last! == "/") {
                result += String(stack.removeLast())
            }
            stack.append(char)
        case "+","-":
            while !stack.isEmpty, stack.last! != "(" {
                result += String(stack.removeLast())
            }
            stack.append(char)
        default:
            break
        }
    }
    
    while !stack.isEmpty {
        result += String(stack.removeLast())
    }
    
    print(result)
}

main()
