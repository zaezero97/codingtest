//
//  main.swift
//  2800.괄호제거
//
//  Created by 재영신 on 2022/05/05.
//

import Foundation

func main() {
    let str = readLine()!
    var pointArr = [(Int, Int)]()
    
    for (index,char) in str.enumerated() {
        if char == "(" {
            pointArr.append((index, -1))
        } else if char == ")" {
            if let lastIndex = pointArr.lastIndex(where: { $0.1 == -1}) {
                pointArr[lastIndex] = (pointArr[lastIndex].0, index)
            }
            
        }
    }
    
    var result = [String]()
    var combs = [[(Int, Int)]]()
   
    for i in 1 ... pointArr.count {
        comb(n: pointArr.count, r: i, start: 0, answer: [])
    }
    
    
    for points in combs {
        var s = ""
        for (index, char) in str.enumerated() {
            if !points.contains(where: { $0.0 == index || $0.1 == index}) {
               s += String(char)
            }
        }
        
        result.append(s)
    }
    
    Set(result).sorted().forEach {
        print($0)
    }
    
    func comb(n: Int, r: Int, start: Int, answer: [(Int, Int)]) {
        if r == 0 {
            combs.append(answer)
        }
        
        for i in start ..< n {
            comb(n: n, r: r - 1, start: i + 1, answer: answer + [pointArr[i]])
        }
    }
}



main()
