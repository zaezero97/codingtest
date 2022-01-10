//
//  main.swift
//  1074.Z
//
//  Created by 재영신 on 2022/01/10.
//

import Foundation

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let N = input[0]
let r = input[1]
let c = input[2]
var count = 0

divideAndConquer(n: Int(pow(2.0,Double(N))), x: 0, y: 0)

func divideAndConquer(n: Int,x: Int,y: Int) {
    
    if n == 1 {
        print(count)
        return
    }
    
    if r < x + n / 2 , c < y + n / 2 {
        divideAndConquer(n: n / 2, x: x, y: y)
    } else if r < x + n / 2 , c < y + n / 2 + ( n / 2) {
        count += (n / 2) * (n / 2)
        divideAndConquer(n: n / 2 , x: x, y: y + n / 2)
    } else if r < x + n / 2 + (n / 2) , c < y + n / 2 {
        count += (n / 2) * (n / 2) * 2
        divideAndConquer(n: n / 2, x: x + n / 2, y: y )
    } else {
        count += (n / 2) * (n / 2) * 3
        divideAndConquer(n: n / 2, x: x + n / 2, y: y + n / 2 )
    }
}
