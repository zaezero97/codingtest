//
//  main.swift
//  1620.나는야 포켓몬 마스터 이다솜
//
//  Created by 재영신 on 2022/06/02.
//

import Foundation

func main() {
    let firstInput = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    let n = firstInput[0]
    let m = firstInput[1]
    
    var dic1 = [String: Int]()
    var dic2 = [Int: String]()
    
    for i in 0 ..< n {
        let input = readLine()!
        dic1[input] = i
        dic2[i] = input
    }
    
    print(dic1)
    for _ in 0 ..< m {
        let input = readLine()!
        
        if let num = Int(input) {
            print(dic2[num - 1]!)
        } else {
            print(dic1[input]! + 1)
        }
    }
}

main()

