//
//  main.swift
//  LINECT01. 로그수집
//
//  Created by 재영신 on 2022/03/26.
//

import Foundation

func solution(_ abilities:[Int], _ k:Int) -> Int64 {
    
    var abs = abilities.sorted(by: >)
    var prioritys = [(value:Int, Index: Int)](repeating: (0,0), count: k)
    
    if abs.count % 2 == 1 {
        abs.append(0)
    }
    
    for i in stride(from: 0, to: abs.count, by: 2) {
        let dis = abs[i] - abs[i+1]
        if prioritys.isEmpty || prioritys.last!.value < dis {
            prioritys.removeLast()
            prioritys.append((dis,i))
            prioritys.sort(by: { $0.value > $1.value})
        }
    }
    
    var priorityIndex = 0
    var result = 0
    for i in stride(from: 0, to: abs.count, by: 2) {
        
        if priorityIndex != prioritys.count, prioritys[priorityIndex].Index == i {
            result += abs[i]
            priorityIndex += 1
        } else {
            result += abs[i+1]
        }
    }
    return 0
}

let _ = solution([2, 8, 3, 6, 1, 9, 1, 9] , 2)
