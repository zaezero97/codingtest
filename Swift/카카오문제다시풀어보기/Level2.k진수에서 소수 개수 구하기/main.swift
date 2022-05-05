//
//  main.swift
//  카카오문제다시풀어보기
//
//  Created by 재영신 on 2022/05/04.
//

import Foundation

func solution(_ lines:[String]) -> Int {
    
    var max = 0

    let logs = lines.map {
        line -> (startTime: Double, endTime: Double) in
        let splitedLine = line.split(separator: " ").map { String($0) }
        let splitedTime = splitedLine[1].split(separator: ":").map { Double(String($0))! }
        let duration = Double(splitedLine[2][splitedLine[2].startIndex ..< splitedLine[2].index(before: splitedLine[2].endIndex)])!
        
        let endTime = splitedTime[0] * 3600 + splitedTime[1] * 60 + splitedTime[2]
        let startTime = endTime - (duration - 0.001)
        return (startTime, round(endTime * 1000.0)/1000.0)
    }
    
    for i in 0 ..< logs.count {
        let log = logs[i]
        var count = 0
        for j in 0 ..< logs.count {
            
            if logs[j].startTime >= (log.startTime + 1.0) || logs[j].endTime < log.startTime {
                continue
            }
            
            if logs[j].startTime <= log.startTime, logs[j].endTime <= (log.startTime + 1.0) {
                count += 1
            } else if logs[j].startTime > log.startTime, logs[j].endTime < log.startTime + 1.0 {
                count += 1
            } else if logs[j].startTime > log.startTime, logs[j].endTime >= log.startTime + 1.0 {
                count += 1
            } else if logs[j].startTime <= log.startTime, logs[j].endTime >= log.startTime + 1.0 {
                count += 1
            }
        }
        
        if max < count {
            max = count
        }
        count = 0
        for j in 0 ..< logs.count {
            if logs[j].startTime >= (log.endTime + 1.0) || logs[j].endTime < log.endTime {
                continue
            }
            if logs[j].startTime <= log.endTime, logs[j].endTime <= (log.endTime + 1.0) {
                count += 1
            } else if logs[j].startTime > log.endTime, logs[j].endTime < log.endTime + 1.0 {
                count += 1
            } else if logs[j].startTime > log.endTime, logs[j].endTime >= log.endTime + 1.0 {
                count += 1
            } else if logs[j].startTime <= log.endTime, logs[j].endTime >= log.endTime + 1.0 {
                count += 1
            }
        }
        
        
        if max < count {
            max = count
        }
        
    }
    
    print(logs)

    return max
}

print(solution([
    "2016-09-15 01:00:04.002 2.0s",
    "2016-09-15 01:00:07.000 2s"
    ]))
