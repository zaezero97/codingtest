//
//  main.swift
//  LINECT01. 로그수집
//
//  Created by 재영신 on 2022/03/26.
//

import Foundation

func solution(_ num_teams:Int, _ remote_tasks:[String], _ office_tasks:[String], _ employees:[String]) -> [Int] {
    
    var teamNotWorkMembers = [Int?](repeating: nil, count: num_teams)
    var teamWorks = [Bool](repeating: false, count: num_teams)
    
    var result = [Int]()
    
    for (index,employee) in employees.enumerated() {
        let info = employee.components(separatedBy: " ")
        let teamNumber = Int(info[0])!
        
        for i in 1 ..< info.count {
            if office_tasks.contains(info[i]) {
                teamWorks[teamNumber - 1] = true
                result.append(index + 1)
                break
            }
        }
        
        if result.last != index + 1 {
            if teamNotWorkMembers[teamNumber - 1] == nil {
                teamNotWorkMembers[teamNumber - 1] = index + 1
            }
        }
    }
    
    for (index,teamWork) in teamWorks.enumerated() {
        if teamWork == false {
            if let member = teamNotWorkMembers[index] {
                result.append(member)
            }
        }
    }
    
    
    return Array(Set.init(1...employees.count).subtracting(result)).sorted(by: <)
}

let _ = solution(
    3,
    ["development","marketing","hometask"], ["recruitment","education","officetask"], ["1 development hometask","1 recruitment marketing","2 hometask","2 development marketing hometask","3 marketing","3 officetask","3 development"]
)
