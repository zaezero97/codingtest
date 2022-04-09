//
//  main.swift
//  오늘의집CT
//
//  Created by 재영신 on 2022/04/09.
//

import Foundation

func solution(_ path: String) -> [String] {
    
    var head = 0
    let length = path.count
    let path = Array(path).map { String($0) }
    var time = 0
    var result = [String]()
    while true {
        
        let headChar = path[head]
        var num = 0
        
        for i in head ..< length {
            if path[i] != headChar {
                let start = num - 5 <= 0 ? 0 : num - 5
                time += start
                result.append(
                    "Time \(time): Go Straight \(num - 5 <= 0 ? num*100 : 500)m and turn \(getRotate(headChar, path[i] ))"
                )
                time += num - start
                head = i
                num = 0
                break
            }
            num += 1
        }
        
        if num != 0 {
            break
        }
    }
    
    
    return result
}

func getRotate(_ before: String, _ new: String) -> String {
    switch before {
    case "E":
        return new == "N" ? "left" : "right"
    case "W":
        return new == "N" ? "right" : "left"
    case "N":
        return new == "E" ? "right" : "left"
    case "S":
        return new == "E" ? "left" : "right"
    default:
        return "left"
    }
}

print(solution("EEESEEEEEENNNN"))

