//
//  main.swift
//  카카오문제다시풀어보기
//
//  Created by 재영신 on 2022/05/05.
//

import Foundation

func solution(_ n:Int, _ t:Int, _ m:Int, _ timetable:[String]) -> String {
    
    var timetable = timetable.map {
        time -> Int in
        let splitedStr = time.split(separator: ":").map{ Int(String($0))! }
        return splitedStr[0] * 60 + splitedStr[1]
    }
    
    timetable.sort()
    
    var time = 540
    var people = m
    var last = 540
    for _ in 0 ..< n {
        people = m
        for _ in 0 ..< m {
            if timetable.isEmpty || timetable.first! > time {
                break
            }
            last = timetable.removeFirst()
            people -= 1
        }
        
        time += t
    }
    
    let resultTime = people == 0 ? last - 1 : time - t
    return "\(String(format: "%02d", resultTime / 60)):\(String(format: "%02d", resultTime % 60))"
}

print(solution(1, 1, 5, ["08:00", "08:01", "08:02", "08:03"]))
