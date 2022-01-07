//
//  main.swift
//  1002.터렛
//
//  Created by 재영신 on 2022/01/06.
//

import Foundation

let T = Int(readLine()!)!
main()
func main() {
    
    for _ in 0 ..< T {
        let input = readLine()!.split(separator: " ").map{ Double($0)! }
   
        getRyuPoint(point1: (x: input[0],y: input[1], r: input[2]), point2: (x: input[3],y: input[4], r: input[5]))
    }
}
func getRyuPoint(point1: (x: Double, y: Double, r: Double), point2: (x: Double, y: Double, r: Double)) {
    let dis: Double = pow(point1.x - point2.x,2) + pow(point1.y - point2.y,2)
    let addPow: Double = pow(point1.r + point2.r, 2)
    let subPow: Double = pow(point1.r - point2.r, 2)
    if point1.x == point2.x, point1.y == point2.y , point1.r == point2.r{
        print("-1")
    } else if dis > addPow || dis < subPow {
        print("0")
    } else if dis == addPow || dis == subPow {
        print("1")
    }  else {
        print("2")
    }
    
}

