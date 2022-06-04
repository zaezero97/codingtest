//
//  main.swift
//  14916.거스름돈
//
//  Created by 재영신 on 2022/06/04.
//

import Foundation

func main() {
    var n = Int(readLine()!)!
    var result = 0
    if n % 5 == 0 {
        print(n/5)
        exit(EXIT_SUCCESS)
    }
    
    while n % 5 != 0, n > 0 {
        result += 1
        n -= 2
    }
    
    print(n % 5 == 0 ? result + (n / 5) : -1 )
}

main()

