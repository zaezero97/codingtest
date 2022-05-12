//
//  main.swift
//  1935.후위 표기식2
//
//  Created by 재영신 on 2022/05/12.
//

import Foundation

func main() {
    let n = Int(readLine()!)!
    
    let expression = readLine()!
    
    var values = [Double]()
    var stack = [Double]()
    for _ in 0 ..< n {
        values.append(Double(readLine()!)!)
    }
    
    for char in expression {
        switch char {
        case "+":
            let n1 = stack.removeLast()
            let n2 = stack.removeLast()
            stack.append(n1+n2)
        case "*":
            let n1 = stack.removeLast()
            let n2 = stack.removeLast()
            stack.append(n1*n2)
        case "-":
            let n1 = stack.removeLast()
            let n2 = stack.removeLast()
            stack.append(n2-n1)
        case "/":
            let n1 = stack.removeLast()
            let n2 = stack.removeLast()
            stack.append(n2/n1)
        default:
            stack.append(values[Int(char.unicodeScalars.first!.value - Unicode.Scalar("A").value)])
        }
    }

    print(String(format: "%.2f", stack.first!))
}

main()
