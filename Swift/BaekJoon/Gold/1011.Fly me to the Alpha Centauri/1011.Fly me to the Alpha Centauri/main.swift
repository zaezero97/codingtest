//
//  main.swift
//  1011.Fly me to the Alpha Centauri
//
//  Created by 재영신 on 2022/01/07.
//

import Foundation

let T = Int(readLine()!)!

main()

func main() {
    
    for _ in 0 ..< T {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        
        let dis = input[1] - input[0]
        let a = Int(sqrt(Double(dis)))
        
        if dis == a*a {
            print(2*a-1)
        } else if a*a < dis , dis <= a*a+a {
            print(2*a)
        } else if a*a+a < dis , dis < (a+1) * (a+1) {
            print(2*a+1)
        }
        
    }
}



