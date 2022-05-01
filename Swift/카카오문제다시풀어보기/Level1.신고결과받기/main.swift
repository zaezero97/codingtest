//
//  main.swift
//  카카오문제다시풀어보기
//
//  Created by 재영신 on 2022/05/01.
//
import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    let set = Set<String>(report)
    var reports = [String: [String]]()
    var result = [String: Int]()
    
    id_list.forEach { id in
        reports[id] = [String]()
        result[id] = 0
    }

    for str in set {
        let report = str.components(separatedBy: " ")
        reports[report[1]]!.append(report[0])
    }

    reports.forEach { reciver, reporters in
        if reporters.count >= k {
            reporters.forEach { reporter in
                result[reporter]! += 1
            }
        }
    }

    var answer: [Int] = []
    id_list.forEach { id in
        answer.append(result[id]!)
    }
    return answer
}
