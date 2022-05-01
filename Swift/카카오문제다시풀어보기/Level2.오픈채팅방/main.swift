//
//  main.swift
//  카카오문제다시풀어보기
//
//  Created by 재영신 on 2022/05/01.
//

import Foundation

func solution(_ record:[String]) -> [String] {
    
    var dic = [String: String]()
    var result = [String]()
    
    for i in 0 ..< record.count {
        let spiltedRecord = record[i].split(separator: " ").map { String($0) }
        
        switch spiltedRecord[0] {
        case "Enter":
            dic[spiltedRecord[1]] = spiltedRecord[2]
            result.append("\(spiltedRecord[1])님이 들어왔습니다.")
        case "Leave":
            result.append("\(spiltedRecord[1])님이 나갔습니다.")
        case "Change":
            dic.updateValue(spiltedRecord[2], forKey: spiltedRecord[1])
        default:
            break
        }
    }
    
    for i in 0 ..< result.count {
        let uid = String(result[i].split(separator: "님")[0])
        result[i] = result[i].replacingOccurrences(of: uid, with: dic[uid]!)
    }
    return result
}
