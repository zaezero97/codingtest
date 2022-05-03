//
//  main.swift
//  카카오문제다시풀어보기
//
//  Created by 재영신 on 2022/05/03.
//

import Foundation

func search(points: [Int], target: Int) -> Int{
    
    if points.isEmpty {
        return 0
    }
    var low = 0
    var high = points.count - 1
    
    while high >= low {
        let mid = (high + low) / 2
        if points[mid] < target {
            low = mid + 1
        } else {
            high = mid - 1
        }
    }
    
    return points.count - low
}
func solution(_ info:[String], _ query:[String]) -> [Int] {
    var result = [Int]()
    var dic = [String: [Int]]()
    
    func dfs(pos: String, depth: Int, info: [String]) {
        
        if depth == 4 {
            var points = dic[pos] ?? []
            points.append(Int(info[4])!)
            dic[pos] = points
            return
        }
        
        dfs(pos: pos + "-", depth: depth + 1, info: info)
        dfs(pos: pos + info[depth], depth: depth + 1, info: info)
    }
    
    for i in 0 ..< info.count {
        let splitedInfo = info[i].split(separator: " ").map { String($0) }
        dfs(pos: "", depth: 0, info: splitedInfo)
    }
    
    for key in dic.keys {
        dic[key]?.sort()
    }
    
    for i in 0 ..< query.count {
        // 0:언어 , 1:직군, 2: 레벨, 3: 음식, 4: 점수
        let splitedQuery = query[i].replacingOccurrences(of: " and ", with: "").components(separatedBy: " ")
       
        let key = splitedQuery[0]
        
        result.append(search(points: dic[key] ?? [], target: Int(splitedQuery[1])!))
    }

    return result
}



print(solution(
    ["java backend junior pizza 150","python frontend senior chicken 210","python frontend senior chicken 150","cpp backend senior pizza 260","java backend junior chicken 80","python backend senior chicken 50"],
    ["- and - and - and - 150"]
))
