//
//  main.swift
//  어린왕자
//
//  Created by 재영신 on 2022/01/03.
//

import Foundation

let T = Int(readLine()!)!
var point: [Int]!  // 0 : x1 , 1: y1 , 2: x2, 3: y2
var n: Int!
var circlePoints: [[Int]]! // circlePoint[i][0]: Cx, circlePoint[i][1]: Cy, circlePoint[i][2]: r
var answer: [Int] = []
for _ in 0 ..< T {
    point = readLine()!.components(separatedBy: " ").compactMap{Int($0)}
    n = Int(readLine()!)!
    circlePoints = [[Int]](repeating: [Int](repeating: 0, count: 3), count: n)
    for _ in 0 ..< n {
        circlePoints.append(readLine()!.components(separatedBy: " ").compactMap{ Int($0) })
    }
    answer.append(getEnterPlanet())
}
answer.forEach {
    print($0)
}

func getEnterPlanet() -> Int{
    var result = 0
    var in1 = false
    var in2 = false
    for i in 0 ..< circlePoints.count {
        
        in1 = pow(Float(circlePoints[i][0] - point[0]),2.0) + pow(Float(circlePoints[i][1] - point[1]),2.0) < pow(Float(circlePoints[i][2]),2.0)
        in2 = pow(Float(circlePoints[i][0] - point[2]),2.0) + pow(Float(circlePoints[i][1] - point[3]),2.0) < pow(Float(circlePoints[i][2]),2.0)
        
        if in1 != in2 {
            result += 1
        }
    }
    
    return result
}
