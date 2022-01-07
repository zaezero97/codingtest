//
//  main.swift
//  1024.수열의합
//
//  Created by 재영신 on 2022/01/07.
//

import Foundation

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let N = input[0]
var L = input[1]

main()

func main() {
    var t = 0
    var start = 0
    for i in L ... 100 {
        t = (i-1)*i/2
        if (N-t) % i == 0 , (N-t)/i >= 0
        {
            start = (N-t)/i
            for j in 0 ..< i {
                print(start+j,terminator: " ")
            }
            exit(EXIT_SUCCESS)
        }
    }
    print("-1")

}

