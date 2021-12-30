//
//  main.swift
//  물병
//
//  Created by 재영신 on 2021/12/30.
//

import Foundation

let input = readLine()!.components(separatedBy: " ")
var N = Int(input[0])!
let K = Int(input[1])!

if N <= K {
    print(0)
    exit(EXIT_SUCCESS)
}

var result = 0

while true {
    var cnt = 0
    var tmp = N
    while tmp > 0 {
        if tmp % 2 != 0 {
            cnt += 1
        }
        tmp /= 2
    }
    
    if cnt <= K {
        print(result)
        exit(EXIT_SUCCESS)
    }
    
    N += 1
    result += 1
}



