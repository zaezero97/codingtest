//
//  main.swift
//  약수
//
//  Created by 재영신 on 2021/12/30.
//

import Foundation

let divisorN = Int(readLine()!)
let divisors = readLine()!.components(separatedBy: " ").map{ Int($0)! }


print(divisors.max()! * divisors.min()!)
