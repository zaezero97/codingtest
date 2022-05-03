//
//  main.swift
//  카카오문제다시풀어보기
//
//  Created by 재영신 on 2022/05/04.
//

import Foundation

func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    
    var queue = [String]()
    var result = 0
    
    if cacheSize == 0 {
        return cities.count * 5
    }
    
    for i in 0 ..< cities.count {
        //cache hit
        if let index = queue.firstIndex(of: cities[i].uppercased()) {
            let city = queue.remove(at: index)
            queue.append(city)
            result += 1
        } else { // miss
            if queue.count == cacheSize {
                queue.removeFirst()
            }
            queue.append(cities[i].uppercased())
            result += 5
        }
    }
    return result
}

print(solution(3, ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "Jeju", "Pangyo", "Seoul", "NewYork", "LA"]))
