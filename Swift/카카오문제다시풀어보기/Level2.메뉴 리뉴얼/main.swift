//
//  main.swift
//  카카오문제다시풀어보기
//
//  Created by 재영신 on 2022/05/01.
//


import Foundation

func solution(_ orders: [String], _ course:[Int]) -> [String] {
    var result = [String: Int]()
    func combination (order: [String], start: Int, n: Int, r: Int, str: String){
        if r == 0 {
            let str = str.sorted().map { String($0) }.joined()
            if let n = result[str] {
                result[str] = n + 1
            } else {
                result[str] = 1
            }
            return
        }
        
        for i in start ..< n {
            combination(order: order, start: i + 1, n: n, r: r - 1, str: str + String(order[i]))
        }
    }
    
    for i in 0 ..< orders.count {
        for j in 0 ..< course.count {
            combination(order: orders[i].map { String($0)}, start: 0, n: orders[i].count, r: course[j], str: "")
        }
    }
    
    var answer = [String]()
    
    
    for i in 0 ..< course.count {
        var max = 1
        var temps = [String]()
        for key in result.keys {
            if key.count == course[i] {
                if result[key]! > max {
                    temps = [key]
                    max = result[key]!
                } else if result[key]! == max {
                    temps.append(key)
                }
            }
        }
        if max > 1 {
            answer.append(contentsOf: temps)
        }
    }
    return answer.sorted()
}

print(solution(["XYZ", "XWY", "WXA"], [2,3,4] ))
