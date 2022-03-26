//
//  main.swift
//  LINECT01. 로그수집
//
//  Created by 재영신 on 2022/03/26.
//

import Foundation

func solution(_ sentences:[String], _ n:Int) -> Int {
    
    let shift = "SHIFT"
    
    var keys: [[String]] = []
    var min = 9999
    for sentence in sentences {
        var dupRemoveArr = Array(Set(sentence).map { String($0) })
        dupRemoveArr.removeAll(where: { $0 == " "})
        if dupRemoveArr.contains(where: { $0 >= "A" && $0 <= "Z" }) {
            dupRemoveArr.append(shift)
        }
        
        let count = dupRemoveArr.count
        if count < min {
            min = count
        }
        
        keys.append(dupRemoveArr.map { $0.lowercased() } )
        
    }
    
    if n < min {
        return 0
    }
    
    var result = 0
    for i in 0 ..< keys.count {
        for j in (i+1) ..< keys.count {
            let union = Set(keys[i] + keys[j])
            var point = 0
            if union.count > n {
                continue
            }
            for z in 0 ..< keys.count {
                if union.union(keys[z]) == union {
                    point += sentences[z].map(
                        {
                            if $0.isUppercase {
                                return 2
                            }else {
                                return 1
                            }
                        }).reduce(0, +)
                }
            }
            if point > result {
                result = point
            }
            
        }
    }
    
    return result
    
}

print(solution(["line in line", "LINE", "in lion"], 5))

