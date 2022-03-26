//
//  main.swift
//  LINECT01. 로그수집
//
//  Created by 재영신 on 2022/03/26.
//

import Foundation

func solution(_ logs:[String]) -> Int {
    
    let logTitles = ["team_name", "application_name", "error_level", "message"]
    let regex = "^[A-Za-z]*$"
    
    var result = 0
    for i in 0 ..< logs.count {
        let log = logs[i]
        
        // 로그 길이
        if log.count > 100 {
            result += 1
            continue
        }
        
        let arr = log.components(separatedBy: " ")
        
        for j in stride(from: 0, to: 12, by: 3) {
            
            //쓸데없는 공백포함된 경우
            if arr.count != 12 {
                result += 1
                break
            }
            
            if logTitles[j/3] != arr[j] {
                result += 1
                break
            } else if arr[j+1] != ":" {
                result += 1
                break
            } else if arr[j+2].range(of: regex, options: .regularExpression) == nil {
                result += 1
                break
            }
        }
    }
    return result
}

//print(solution(["team_name : MyTeam application_name : YourApp error_level : info messag : IndexOutOfRange", "no such file or directory", "team_name : recommend application_name : recommend error_level : info message : RecommendSucces11", "team_name : recommend application_name : recommend error_level : info message : Success!", "   team_name : db application_name : dbtest error_level : info message : test", "team_name     : db application_name : dbtest error_level : info message : test", "team_name : TeamTest application_name : TestApplication error_level : info message : ThereIsNoError"]))
