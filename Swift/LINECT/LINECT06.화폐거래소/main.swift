//
//  main.swift
//  LINECT01. 로그수집
//
//  Created by 재영신 on 2022/03/26.
//

import Foundation

struct REQINFO {
    let type: Int
    let amount: Int
    let price: Int
    let index: Int
}
func solution(_ req_id:[String], _ req_info:[[Int]]) -> [String] {
    
    // 큐를 이용해서 풀어야 할 것 같다
    var pending: REQINFO?
    let first = req_info.first!
    var result: [String] = []
    pending = REQINFO(type: first[0],
                amount: first[1],
                price: first[2],
                      index: 0
               )
    
    
    for i in 1 ..< req_info.count {
        let req = req_info[i]
        if pending != nil {
            if pending!.type == 1{
                
            }
        }
       
        
    }
    
    
    return []
}

let _ = solution(["William", "Andy", "Rohan", "Rohan", "Louis", "Andy"], [[1, 7, 20], [0, 10, 10], [1, 10, 40], [1, 4, 25], [0, 5, 11], [0, 20, 30]])
