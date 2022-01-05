//
//  main.swift
//  9009.피보나치
//
//  Created by 재영신 on 2022/01/05.
//

import Foundation

let T = Int(readLine()!)!
var fibo = [Int]()
main()

func main() {
    fibo.append(0)
    fibo.append(1)
    
    for i in 2 ..< 46 {
        fibo.append(fibo[i-1]+fibo[i-2])
    }
    for _ in 0 ..< T {
        getFibo(Int(readLine()!)!)
    }
}


func getFibo(_ n: Int) {
    var n = n
    var result = [Int]()

    while n != 0 {
        for i in 0 ..< fibo.count {
            if fibo[i] > n {
                n -= fibo[i-1]
                result.append(fibo[i-1])
                break
            }
        }
    }
    for res in result.reversed() {
        print(res,terminator: " ")
    }
}
