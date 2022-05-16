//
//  main.swift
//  1966.프린터 큐
//
//  Created by 재영신 on 2022/05/16.
//

import Foundation

func main() {
    let t = Int(readLine()!)!
    
    for _ in 0 ..< t {
        let firstInput = readLine()!.split(separator: " ").map { Int(String($0))! }
        _ = firstInput[0]
        let m = firstInput[1]
        var turn = 0
        var queue = readLine()!.split(separator: " ").enumerated().map { ($0.offset, Int(String($0.element))!) }
        
        while true {
            let first = queue.first!
            if !queue.contains(where: { $0.1 > first.1 }) {
                turn += 1
                if queue.removeFirst().0 == m {
                    print(turn)
                    break
                }
            } else {
                queue.append(queue.removeFirst())
            }
        }
        
    }
}

main()
