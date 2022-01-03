//
//  main.swift
//  개미의 이동
//
//  Created by 재영신 on 2022/01/03.
//

import Foundation

let firstInput = readLine()!.components(separatedBy: " ").compactMap{ Int($0) }
let L = firstInput[0] // 줄 길이
let T = firstInput[1]
let N = Int(readLine()!)! // 개미 수
var ants = [(loc:Int,dic: String)]()

for _ in 0 ..< N {
    let antInput = readLine()!.components(separatedBy: " ")
    ants.append((loc: Int(antInput[0])!, dic: antInput[1]))
}



for i in 0 ..< N {
    var p = 0
    var q = 0
    var t = 0
    if ants[i].dic == "L" {
        t = T - ants[i].loc
        if t < 0 {
            ants[i].loc -= T
        } else {
            p = t / L
            q = t % L
            ants[i].loc = ((p & 1) != 0) ? L - q: q
        }
    } else {
        t = T - (L - ants[i].loc)
        if t < 0 {
            ants[i].loc += T
        } else  {
            p = t / L
            q = t % L
            ants[i].loc = ((p & 1) != 0) ? q : L - q
        }
    }
}

ants.sort { ant1, ant2 in
    ant1.loc < ant2.loc
}

ants.forEach { ant in
    print(ant.loc,terminator: " ")
}
