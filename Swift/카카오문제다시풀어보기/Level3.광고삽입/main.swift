//
//  main.swift
//  카카오문제다시풀어보기
//
//  Created by 재영신 on 2022/05/06.
//

import Foundation

func makeTimeToSec(_ time: String) -> Int {
    let splitedTime = time.split(separator: ":").map { String($0) }
    return  Int(splitedTime[0])! * 3600 + Int(splitedTime[1])! * 60 + Int(splitedTime[2])!
}
func solution(_ play_time:String, _ adv_time:String, _ logs:[String]) -> String {
    
    let playTimeSec = makeTimeToSec(play_time)
    let advTimeSec = makeTimeToSec(adv_time)
    
    let splitedLogs = logs.map{ $0.split(separator: "-").map(String.init) }
    var logStartTimeSecs = [Int]()
    var logEndTimeSecs = [Int]()
    
    for i in 0 ..< splitedLogs.count {
        let log = splitedLogs[i]
        logStartTimeSecs.append(makeTimeToSec(log[0]))
        logEndTimeSecs.append(makeTimeToSec(log[1]))
    }
    
    var total_times = [Double](repeating: 0, count: playTimeSec + 1)
    
    for i in 0 ..< logs.count {
        total_times[logStartTimeSecs[i]] += 1.0
        total_times[logEndTimeSecs[i]] -= 1.0
    }
    
    
    for i in 1 ... playTimeSec {
        total_times[i] = total_times[i] + total_times[i-1]
    }
    
    for i in 1 ... playTimeSec {
        total_times[i] = total_times[i] + total_times[i-1]
    }
    
    
    var maxTime: Double = total_times[advTimeSec - 1]
    var maxStart: Int = 0

    for i in (advTimeSec - 1) ... playTimeSec {
        
        if i >= advTimeSec {
            let temp = total_times[i] - total_times[i-advTimeSec]
            
            if temp > maxTime {
                maxTime = temp
                maxStart = i - advTimeSec + 1
            }
        } else {
            let temp = total_times[i]
            
            if temp > maxTime {
                maxTime = temp
                maxStart = i - advTimeSec + 1
            }
        }
        
    }
    return makeString(seconds: maxStart)
}

func makeString(seconds: Int) -> String {
    let hour = seconds/3600
    let hourString = hour < 10 ? "0\(seconds/3600)" : "\(seconds/3600)"
    let minute = seconds/60%60
    let minuteString = minute < 10 ? "0\(seconds/60%60)" : "\(seconds/60%60)"
    let second = seconds%60
    let secondString = second < 10 ? "0\(seconds%60)" : "\(seconds%60)"
    return "\(hourString):\(minuteString):\(secondString)"
}



print(solution("02:03:55", "00:14:15", ["01:20:15-01:45:14", "00:40:31-01:00:00", "00:25:50-00:48:29", "01:30:59-01:53:29", "01:37:44-02:02:30"]))



